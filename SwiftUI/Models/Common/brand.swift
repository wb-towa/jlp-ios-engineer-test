//
//  brand.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation


/// A struct for decoding a brand JSON blob
///
struct Brand: Decodable {

    private enum CodingKeys: String, CodingKey {
        case logo
        case name
    }

    let logo: String
    let name: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.logo = try! values.decode(String.self, forKey: CodingKeys.logo)
        self.name = try! values.decode(String.self, forKey: CodingKeys.name)
    }
}
