//
//  pageInformation.swift
//  jlp-ios-engineer-testTests
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
///    {
///        "title": "Dishwashers | Electricals | John Lewis & Partners",
///        "heading": "Dishwashers",
///        "description": "Shop for Dishwashers from our Electricals range at John Lewis & Partners. Free UK mainland delivery when you spend £50 and over.",
///        "noIndex": false,
///        "noFollow": false
///    }
///
struct PageInformation: Decodable {

    private enum CodingKeys: String, CodingKey {
        case title
        case heading
        case description
        case noIndex
        case noFollow
    }

    let title: String
    let heading: String
    let description: String
    let noIndex: Bool
    let noFollow: Bool

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try! values.decode(String.self, forKey: CodingKeys.title)
        self.heading = try! values.decode(String.self, forKey: CodingKeys.heading)
        self.description = try! values.decode(String.self, forKey: CodingKeys.description)
        self.noIndex = try! values.decode(Bool.self, forKey: CodingKeys.noIndex)
        self.noFollow = try! values.decode(Bool.self, forKey: CodingKeys.noFollow)
    }
}
