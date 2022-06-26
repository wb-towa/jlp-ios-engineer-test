//
//  availability.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
///    {
///        "availabilityStatus": "INSTOCK",
///        "stockLevel": 274,
///        "message": "Currently in stock online",
///        "isPreorder": false
///    }
///
struct Availability: Decodable {

    private enum CodingKeys: String, CodingKey {
        case availabilityStatus
        case stockLevel
        case message
        case isPreorder
    }

    let availabilityStatus: String
    let stockLevel: Int
    let message: String
    let isPreorder: Bool

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.availabilityStatus = try! values.decode(String.self, forKey: CodingKeys.availabilityStatus)
        self.stockLevel = try! values.decode(Int.self, forKey: CodingKeys.stockLevel)
        self.message = try! values.decode(String.self, forKey: CodingKeys.message)
        self.isPreorder = try! values.decode(Bool.self, forKey: CodingKeys.isPreorder)
    }
}
