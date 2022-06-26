//
//  delivery.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation


/// A struct for decoding a `detail` JSON blob
struct Delivery: Decodable {

    private enum CodingKeys: String, CodingKey {
        case options
        case deliveryType
    }

    let options: [DeliveryOption]
    let deliveryType: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.options = try! values.decode([DeliveryOption].self, forKey: CodingKeys.options)
        self.deliveryType = try! values.decode(String.self, forKey: CodingKeys.deliveryType)
    }
}


/// A struct for decoding a `deliveries[0].options` JSON blob
struct DeliveryOption: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id
        case newPriority
        case newShortDescription
        case price
        case shortDescription
        case isApprovedSupplier
        case standardDescription
        case newStandardDescription
    }

    let id: String
    let newPriority: Int
    let newShortDescription: String
    let price: String
    let shortDescription: String
    let isApprovedSupplier: Bool
    let standardDescription: String
    let newStandardDescription: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try! values.decode(String.self, forKey: CodingKeys.id)
        self.newPriority = try! values.decode(Int.self, forKey: CodingKeys.newPriority)
        self.newShortDescription = try! values.decode(String.self, forKey: CodingKeys.newShortDescription)
        self.price = try! values.decode(String.self, forKey: CodingKeys.price)
        self.shortDescription = try! values.decode(String.self, forKey: CodingKeys.shortDescription)
        self.isApprovedSupplier = try! values.decode(Bool.self, forKey: CodingKeys.isApprovedSupplier)
        self.standardDescription = try! values.decode(String.self, forKey: CodingKeys.standardDescription)
        self.newStandardDescription = try! values.decode(String.self, forKey: CodingKeys.newStandardDescription)
    }
}
