//
//  messaging.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
///    {
///        "title": "Reduced To Clear",
///        "type": "promotional"
///    }
/// 
struct Message: Decodable {

    private enum CodingKeys: String, CodingKey {
        case title
        case type
    }

    let title: String
    let type: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try! values.decode(String.self, forKey: CodingKeys.title)
        self.type = try! values.decode(String.self, forKey: CodingKeys.type)
        /**
         TODO: Ideally we would know all of the types and consider validating that it's a correct type.
         */
    }
}
