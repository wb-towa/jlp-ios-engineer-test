import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let contentView = ContentView()

        view = UIHostingView(rootView: contentView)
        view.isOpaque = true
    }


}

