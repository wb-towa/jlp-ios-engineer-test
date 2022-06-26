//
//  category.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
///    {
///        "id": "6000047",
///        "name": "Dishwashers"
///    }
///
struct Category: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    let id: String
    let name: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try! values.decode(String.self, forKey: CodingKeys.id)
        self.name = try! values.decode(String.self, forKey: CodingKeys.name)
    }
}
