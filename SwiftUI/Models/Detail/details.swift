//
//  detail.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation


/// A struct for decoding a product detail view's `details` JSON blob
struct Details: Decodable {

    private enum CodingKeys: String, CodingKey {
        case features
        case editorsNotes
        case featuredArticles
        case buyingGuides
        case productInformation
    }

    let features: [Features]
    let editorsNotes: String
    let featuredArticles: [LinkURL]
    let buyingGuides: [LinkURL]
    let productInformation: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.features = try! values.decode([Features].self, forKey: CodingKeys.features)
        self.editorsNotes = try! values.decode(String.self, forKey: CodingKeys.editorsNotes)
        self.featuredArticles = try! values.decode([LinkURL].self, forKey: CodingKeys.featuredArticles)
        self.buyingGuides = try! values.decode([LinkURL].self, forKey: CodingKeys.buyingGuides)
        self.productInformation = try! values.decode(String.self, forKey: CodingKeys.productInformation)
    }

    func sellingInformation() -> String {
        // TODO: Hacky
        let parts = self.productInformation.split(separator: "\n")

        if parts.count > 2 {
            return String(parts[1])
        }
        return "Something went wrong."
    }

    func topAttributes(max: Int=7) -> [MultiAttribute] {
        if !self.features.isEmpty {
            let attributes = self.features[0].attributes

            if attributes.count <= max {
                return attributes
            }
            return Array(attributes[0..<max])
        }
        return []
    }
}


/// A struct for decoding a product detail view's `details.features` JSON blob
struct Features: Decodable {

    private enum CodingKeys: String, CodingKey {
        case attributes
    }

    let attributes: [MultiAttribute]

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.attributes = try! values.decode([MultiAttribute].self, forKey: CodingKeys.attributes)
    }
}

