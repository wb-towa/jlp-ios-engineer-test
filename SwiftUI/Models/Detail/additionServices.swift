//
//  additionServices.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation


/// A struct for decoding a `additionalServices` JSON blob
struct AdditionalServices: Decodable {

    private enum CodingKeys: String, CodingKey {
        case includedServices
        case optionalServices
    }

    let includedServices: [String]
    let optionalServices: [OptionalService]

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.includedServices = try! values.decode([String].self, forKey: CodingKeys.includedServices)
        self.optionalServices = try! values.decode([OptionalService].self, forKey: CodingKeys.optionalServices)
    }
}


/// A struct for decoding a `additionalServices.optionalServices` JSON blob
struct OptionalService: Decodable {

    private enum CodingKeys: String, CodingKey {
        case associatedProductId
        case orderOnSite
        case title
        case id
        case description
        case price
        case type
    }

    let associatedProductId: String
    let orderOnSite: Int
    let title: String
    let id: String
    let description: String
    let price: String
    let type: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.associatedProductId = try! values.decode(String.self, forKey: CodingKeys.associatedProductId)
        self.orderOnSite = try! values.decode(Int.self, forKey: CodingKeys.orderOnSite)
        self.title = try! values.decode(String.self, forKey: CodingKeys.title)
        self.id = try! values.decode(String.self, forKey: CodingKeys.id)
        self.description = try! values.decode(String.self, forKey: CodingKeys.description)
        self.price = try! values.decode(String.self, forKey: CodingKeys.price)
        self.type = try! values.decode(String.self, forKey: CodingKeys.type)
    }
}
