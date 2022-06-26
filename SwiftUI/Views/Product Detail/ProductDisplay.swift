//
//  ProductDisplay.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 26/06/2022.
//

import SwiftUI

struct ProductDisplay: View {

    @StateObject var detailProvider = DetailProvider()

    let hackyTitle: String

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    if let displayImage = detailProvider.productInformation.productImage() {
                        Spacer()
                        DisplayImage(imageURL: displayImage)
                        Spacer()
                    }
                }
                .frame(height: 350)
                .padding(.bottom, 15)

                PriceAndPromoView(price: "£0.00", guaranteeInfo: detailProvider.productInformation.guarantees())


                ProductInformationView(
                    sellingText: detailProvider.productInformation.details.sellingInformation(),
                    productCode: detailProvider.productInformation.code
                )

                ProductSpecificationView(attributes: detailProvider.productInformation.details.topAttributes())
            }
        }
        .padding(.horizontal, 20)
        .navigationTitle(hackyTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}
