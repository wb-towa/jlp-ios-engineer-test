//
//  facets.swift
//  jlp-ios-engineer-testTests
//
//  Created by William Baer on 25/06/2022.
//

import Foundation


/// A structure for a facet  JSON structure
///
struct Facet: Decodable {

    private enum CodingKeys: String, CodingKey {
        case dimensionName
        case name
        case type
        case tooltip
        case filterTypes
        case details
    }

    let dimensionName: String
    let name: String
    let type: String
    let tooltip: String
    let filterTypes: [String]
    let details: [FacetDetail]

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.dimensionName = try! values.decode(String.self, forKey: CodingKeys.dimensionName)
        self.name = try! values.decode(String.self, forKey: CodingKeys.name)
        self.type = try! values.decode(String.self, forKey: CodingKeys.type)
        self.tooltip = try! values.decode(String.self, forKey: CodingKeys.tooltip)
        self.filterTypes = try! values.decode([String].self, forKey: CodingKeys.filterTypes)
        self.details = try! values.decode([FacetDetail].self, forKey: CodingKeys.details)
    }
}

/// A structure for a facet detail JSON structure
///
struct FacetDetail: Decodable {

    private enum CodingKeys: String, CodingKey {
        case facetId
        case label
        case quantity = "qty"
        case color
        case colorSwatchUrl
        case isSelected
    }

    let facetId: String
    let label: String
    let quantity: String
    let color: String?
    let colorSwatchUrl: String? // WARN: Assuming a path not a full URL
    let isSelected: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.facetId = try! values.decode(String.self, forKey: CodingKeys.facetId)
        self.label = try! values.decode(String.self, forKey: CodingKeys.label)
        self.quantity = try! values.decode(String.self, forKey: CodingKeys.quantity)
        self.color = try? values.decode(String.self, forKey: CodingKeys.color)
        self.colorSwatchUrl = try? values.decode(String.self, forKey: CodingKeys.colorSwatchUrl)
        self.isSelected = try! values.decode(String.self, forKey: CodingKeys.isSelected)
    }
}
