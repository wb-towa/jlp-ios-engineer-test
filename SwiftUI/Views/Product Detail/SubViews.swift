//
//  SubViews.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 26/06/2022.
//

import SwiftUI

struct PriceAndPromoView: View {

    let price: String
    let guaranteeInfo: String?

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(price)
                    .font(.title)
                    .fontWeight(.medium)
                if let guaranteeInformation = guaranteeInfo {
                    Text(guaranteeInformation)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.green)
                        .brightness(-0.5)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 30)
    }
}

struct ProductInformationView: View {

    let sellingText: String
    let productCode: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Product Information")
                .fontWeight(.thin)
            Text(sellingText)
                .font(.caption)
                .fontWeight(.thin)
            Text("Product code: \(productCode)")
                .font(.caption)
                .fontWeight(.thin)
        }
        .padding(.bottom, 10)
        .border(width: 1, edges: [.bottom], color: .gray.opacity(0.40))
    }
}

struct ProductSpecificationView: View {

    let attributes: [MultiAttribute]

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Product specification")
                    .fontWeight(.thin)

            }
            .padding(.vertical, 25)
            .frame(maxWidth: .infinity, alignment: .leading)

            ForEach(attributes, id: \.self) { multiAttribute in
                VStack {
                    Spacer()
                    HStack {
                        Text(multiAttribute.name)
                            .fontWeight(.thin)
                        Spacer()
                        Text(multiAttribute.value)
                            .fontWeight(.thin)
                    }
                    .padding(.vertical, 10)
                    Spacer()
                }
                .border(width: 1, edges: [.top], color: .gray.opacity(0.40))
                .font(.caption)
            }
        }
    }
}
