//
//  triggerRules.swift
//  jlp-ios-engineer-testTests
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
///    {
///        "dynamic": "top-and-block-banner",
///        "seo": "/etc/product-listing-config/seobanners.csv"
///    }
///
struct TriggeredRules: Decodable {

    private enum CodingKeys: String, CodingKey {
        case dynamic
        case seo
    }

    let dynamic: String
    let seo: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.dynamic = try! values.decode(String.self, forKey: CodingKeys.dynamic)
        self.seo = try! values.decode(String.self, forKey: CodingKeys.seo)
    }
}
