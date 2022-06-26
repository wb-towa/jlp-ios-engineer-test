//
//  service.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation


/// A struct for decoding JSON with this structure:
///
///    {
///        "__typename": "IncludedGuarantee",
///        "title": "2 year guarantee included",
///        "automaticallyIncluded": true
///    }
///
struct Service: Decodable {

    private enum CodingKeys: String, CodingKey {
        case typeName = "__typename"
        case title
        case automaticallyIncluded
    }

    let typeName: String
    let title: String
    let automaticallyIncluded: Bool

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.typeName = try! values.decode(String.self, forKey: CodingKeys.typeName)
        self.title = try! values.decode(String.self, forKey: CodingKeys.title)
        self.automaticallyIncluded = try! values.decode(Bool.self, forKey: CodingKeys.automaticallyIncluded)

        /**
         TODO: Ideally we would know all of the typeNames and consider validating that it's a correct type.
         */
    }
}
