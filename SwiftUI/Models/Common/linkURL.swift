//
//  links.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
///    {
///        "title": "Dishwashers Buying Guide",
///        "linkUrl": "https://www.johnlewis.com/buying-guides/dishwashers-buying-guide"
///    }
///
struct LinkURL: Decodable {

    private enum CodingKeys: String, CodingKey {
        case title
        case linkUrl
    }

    let title: String
    let linkUrl: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try! values.decode(String.self, forKey: CodingKeys.title)
        self.linkUrl = try! values.decode(String.self, forKey: CodingKeys.linkUrl)
    }
}
