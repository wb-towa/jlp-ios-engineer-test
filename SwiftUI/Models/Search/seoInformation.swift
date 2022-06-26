//
//  seoInformation.swift
//  jlp-ios-engineer-testTests
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
///    {
///        "description": "Shop for Dishwashers from our Electricals range at John Lewis & Partners. Free UK mainland delivery when you spend £50 and over.",
///        "noIndex": false
///    }
///
struct SeoInformation: Decodable {

    private enum CodingKeys: String, CodingKey {
        case description
        case noIndex
    }

    let description: String
    let noIndex: Bool

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.description = try! values.decode(String.self, forKey: CodingKeys.description)
        self.noIndex = try! values.decode(Bool.self, forKey: CodingKeys.noIndex)
    }
}
