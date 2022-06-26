//
//  crumb.swift
//  jlp-ios-engineer-testTests
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
///    {
///        "url": "/browse/electricals/dishwashers/_/N-ado",
///        "clickable": "false",
///        "displayName": "Dishwashers",
///        "type": "CATALOGUE",
///        "item": "6000047"
///    }
///
struct Crumb: Decodable {

    private enum CodingKeys: String, CodingKey {
        case url
        case clickable
        case displayName
        case type
        case item
    }

    let url: String?
    let clickable: String
    let displayName: String
    let type: String
    let item: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.url = try? values.decode(String.self, forKey: CodingKeys.url)
        self.clickable = try! values.decode(String.self, forKey: CodingKeys.clickable)
        self.displayName = try! values.decode(String.self, forKey: CodingKeys.displayName)
        self.type = try! values.decode(String.self, forKey: CodingKeys.type)
        self.item = try! values.decode(String.self, forKey: CodingKeys.item)
    }
}
