//
//  DetailProvider.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 26/06/2022.
//

import Foundation


final class DetailProvider: NSObject, ObservableObject {

    @Published var productInformation: ProductInformation

    init(resource: String="detail") {
        let bundle = Bundle(for: Self.self)
        let jsonPath = bundle.path(forResource: resource, ofType: "json")
        let fileManager = FileManager.default

        let jsonData = fileManager.contents(atPath: jsonPath!)

        productInformation = try! JSONDecoder().decode(ProductInformation.self, from: jsonData!)

    }

}
