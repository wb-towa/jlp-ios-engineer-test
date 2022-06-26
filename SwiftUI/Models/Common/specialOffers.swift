//
//  specialOffers.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation
/// A struct for decoding a specialOffers JSON blob
///
struct SpecialOffers: Decodable {

    private enum CodingKeys: String, CodingKey {
        case bundleHeadline
        case priceMatched
        case offer

        /// WARN: drop unknown value `"customSpecialOffer": {}` and related fields
    }

    let bundleHeadline: String
    let priceMatched: String
    let offer: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.bundleHeadline = try! values.decode(String.self, forKey: CodingKeys.bundleHeadline)
        self.priceMatched = try! values.decode(String.self, forKey: CodingKeys.priceMatched)
        self.offer = try! values.decode(String.self, forKey: CodingKeys.offer)
    }
}
