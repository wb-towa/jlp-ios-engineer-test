//
//  SearchResultEntry.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 26/06/2022.
//

import SwiftUI

struct SearchResultEntry: View {

    let product: Product

    var body: some View {
        NavigationLink(destination: ProductDisplay(hackyTitle: product.title)) {
            HStack(alignment: .center) {
                VStack {
                    if let displayImage = product.displayImage() {
                        DisplayImage(imageURL: displayImage)
                    }
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        Text("£0.00")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 500, maxHeight: 500)
            }
            .border(width: 1, edges: [.bottom], color: .gray.opacity(0.40))
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("View more information for \(product.title)")
    }
}
