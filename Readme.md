# Project Notes

## Purpose

Create an iOS app that displays the search results for dishwashers from John Lewis, which allow the user to navigate to a product detail view.

As part of this, I had aimed to focus on:
- Testing
- A functional app
- Accessibility 


## Task Approach

I feel there are two ways to approach this. Focus solely on recreating the UI as seen in the design images, or focus more on code. 
Without using a 3rd party module to generate models or treating the JSON as a big map of data, it feels like there is not enough 
time to do both well, certainly with SwiftUI. So, I have opted to focus on trying to create a reasonable code structure and decent 
code and started the UI last.

As I have applied under the caveat that I’m much stronger in SwiftUI, which might be a problem for an established app, I’ve stuck 
with SwiftUI. By doing this as well, that applies some limits on accurately recreating the UI in a short period of time.

While the readme notes that you can create a project from scratch. I have opted to work on the existing project. This meant 
removing the storyboards, placing some code for pushing into a SwiftUI app.

I started by looking at the data, generating models and writing tests which show that my JSON parsing works. Once I was happy 
with that basis, I started on the UI.

My mock files came from here:
[Listing JSON URL](https://api.johnlewis.com/search/api/rest/v2/catalog/products/search/keyword?q=dishwasher&key=AIzaSyDD_6O5gUgC4tRW5f9kxC0_76XRC8W7_mI)
[Detail JSON URL](https://api.johnlewis.com/mobile-apps/api/v1/products/5798103)


## Issues with the finished project

First, the obvious thing, I did not get to complete the project from the UI design side. It will adjust its grid for both tested 
devices (iPhone 13 mini and iPad Pro 12.9). Practically speaking, I believe the app would be best written with UIKit, or perhaps 
the additions coming to SwiftUI in iOS16 might be enough to better recreate the design images.

As an example, the image carousel would be fairly straightforward in UIKit. It’s not impossible to recreate such a thing in SwiftUI. 
It would likely take more time that should be spent. I did not have existing code of my own to borrow for it. If my memory serves 
me right, in UIKit it needs a `UICollectionView` with paging.

For a real project, I would assume the defined colour set would be held in an assets file or code would be written to pick the 
correct colour. In this version, I’ve simply used `Color.green` with a brightness modifier to make it darker.

Image loading uses `AsyncImage`, this is the first time I’ve used it. When observing how smooth it scrolls and watching the 
performance metrics, I believe this is causing hitching. It’s especially noticeable on the iPad, scrolling creates many threads. 
Without digging too deep, the toggling of progress view and the actual image harms performance even if you do not see the 
progress view. A custom solution with caching should improve this. I might be using the wrong sized images as well, and 
resizing those might be causing issues.

I wanted to make live network requests for the app and use mocked data for testing. There appeared to be a difference. 
So, I made my own copy of the mocked data. Running out of time, I just ended up using my own mocked data for the app 
as well. **Note:** Either the API calls returned bad data or something went wrong making a copy. I’ve noticed 
there’s a lack of space around fullstops, the phrase “Serie” rather than “Series”.

You will also notice there is a hack for producing the Product Information. Looking at the data I got, it looked 
something like this `"productInformation": "Selling text:\nSerie | 4, Fully-in.....` and it has HTML mixed in. 
There appears to be a need to understand how to parse it or, as noted above, perhaps something went wrong with the API call I made.

Since it uses mocked data, any item within the search results goes to the same detail page. However, I do pass in the 
correct product description for the item that was clicked. So, there will be a mismatch on most items when comparing 
the detail view title and the product information.

There appeared to be differences between the provided mock data and the live API calls. That is why I 
created my own under the first assumption I would use live network calls.

Realistically, the JSON parsing and models should be in their own package to allow re-use outside the project.

As the clock ticked down, I think I got sloppy with some naming. As an example, the “Provider” `StateObjects` probably 
would be better done as View Models.

Some values I got back might look like “YES” and the assumption is they’re displayed as “Yes”.  I’ve not formatted 
any of these. Something like `str.capitalized` might work in all scenarios. But there are some “status” kind of 
values that might benefit from further functionality to map those values to display worthy 
values. **Example:** `"availabilityStatus": "INSTOCK")` 

The tests were created just in the existing unit test file. In the real world there should be files that describe 
the unit being tested with just those tests within the files. As an example as noted if the providers were view 
models then there would be a per view model test file extensively testing the view model.

The project relies on assumptions and uses `try!`, especially in the JSON decoding. That would be unacceptable 
in most cases within a publicly released app.


## Further improvements

With a fuller understanding of the data that comes back, better models could be made. One reason I did not 
use live calls is that I noticed that the `dynamicAttributes` appear that their values can be either a 
string or an array of strings. That was a reason for simply falling back to my own mocked data to simply 
remove the string arrays as a shortcut.

There are some stringified values. As an example, boolean values. It might not be sensible to try to 
interpret these values, especially if you were to risk claiming something was on sale when it is not. 
The code to handle these values might look like this:

```swift
import Foundation

func isExample() -> Bool {
    // exampleValue = "true" or "false"
    return exampleValue.trimmingCharacters(in: .whitespacesAndNewlines).localizedCaseInsensitiveCompare("true") == .orderedSame
```

The “Providers” should handle the network requests. Then, as an example, you could model the search page to 
do the initial search within `.OnAppear{}` and if it were sensible, the list could behave as a “pull to refresh” 
with the `.refreshable` modifier.

Where images are displayed, if there was a network failure, the view would break. There should be a “error” 
image, which is the fallback for failed image downloads. Perhaps something like this might be acceptable.

```swift
ZStack {
    Image("my-default")
    
    if let downloadedImage = viewModel.GetImage(path) {
        Image(downloadedImage)
    }
}
```

Images using a progress view to denote loading is not particularly attractive. You might something like toggle 
the view based on the result of the network request and effectively make it so it appears that the 
whole view just appears once all resources as locally available.
