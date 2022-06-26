//
//  attribute.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
///    {
///        "key": "crediteligibilitystatus",
///        "values": [
///            "Core"
///        ],
///        "displayName": "Credit Eligibility Status"
///    }
///
struct Attribute: Decodable {

    private enum CodingKeys: String, CodingKey {
        case key
        case values
        case displayName
    }

    let key: String
    let values: [String]
    let displayName: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.key = try! values.decode(String.self, forKey: CodingKeys.key)
        self.values = try! values.decode([String].self, forKey: CodingKeys.values)
        self.displayName = try! values.decode(String.self, forKey: CodingKeys.displayName)
    }
}


/// A struct for decoding JSON with this structure:
///
///    {
///        "name": "Type",
///        "values": [],
///        "multivalued": false,
///        "value": "Integrated"
///    }
///
struct MultiAttribute: Hashable,  Decodable {

    static func == (lhs: MultiAttribute, rhs: MultiAttribute) -> Bool {
        return lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(value)
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case values
        case multiValued = "multivalued"
        case value
    }

    let name: String
    let values: [String]  /// WARN: Assume this is correct. the data I have choosen for mocking contains all empty arrays
    let multiValued: Bool
    let value: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try! values.decode(String.self, forKey: CodingKeys.name)
        self.values = try! values.decode([String].self, forKey: CodingKeys.values)
        self.multiValued = try! values.decode(Bool.self, forKey: CodingKeys.multiValued)
        self.value = try! values.decode(String.self, forKey: CodingKeys.value)
    }
}
