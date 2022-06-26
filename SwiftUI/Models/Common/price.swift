//
//  price.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding a price JSON blob
///
struct Price: Decodable {

    private enum CodingKeys: String, CodingKey {
        case was
        case currency
        case then1
        case then2
        case now
        case uom
    }

    let was: String
    let currency: String
    let then1: String
    let then2: String
    let now: String
    let uom: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.was = try! values.decode(String.self, forKey: CodingKeys.was)
        self.currency = try! values.decode(String.self, forKey: CodingKeys.currency)
        self.then1 = try! values.decode(String.self, forKey: CodingKeys.then1)
        self.then2 = try! values.decode(String.self, forKey: CodingKeys.then2)
        self.now = try! values.decode(String.self, forKey: CodingKeys.now)
        self.uom = try! values.decode(String.self, forKey: CodingKeys.uom)
    }
}
