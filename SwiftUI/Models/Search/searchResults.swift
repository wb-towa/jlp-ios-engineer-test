//
//  productListing.swift
//  jlp-ios-engineer-testTests
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding `ProductListing` JSON Structure
///
struct SearchResults: Decodable {

    private enum CodingKeys: String, CodingKey {
        case showInStockOnly
        case products
        case facets
        case results
        case pagesAvailable
        case crumbs
        case dynamicBannerId
        case banners
        case seoBannerId
        case pageInformation
        case triggeredRules
        case endecaCanonical
        case baseFacetId
    }

    let showInStockOnly: Bool
    let products: [Product]
    let facets: [Facet]
    let results: Int
    let pagesAvailable: Int
    let crumbs: [Crumb]
    let dynamicBannerId: String
    let banners: Banners
    let seoBannerId: String
    let pageInformation: PageInformation
    let triggeredRules: TriggeredRules
    let endecaCanonical: String
    let baseFacetId: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.showInStockOnly = try! values.decode(Bool.self, forKey: CodingKeys.showInStockOnly)
        self.products = try! values.decode([Product].self, forKey: CodingKeys.products)
        self.facets = try! values.decode([Facet].self, forKey: CodingKeys.facets)
        self.results = try! values.decode(Int.self, forKey: CodingKeys.results)
        self.pagesAvailable = try! values.decode(Int.self, forKey: CodingKeys.pagesAvailable)
        self.crumbs = try! values.decode([Crumb].self, forKey: CodingKeys.crumbs)
        self.dynamicBannerId = try! values.decode(String.self, forKey: CodingKeys.dynamicBannerId)
        self.banners = try! values.decode(Banners.self, forKey: CodingKeys.banners)
        self.seoBannerId = try! values.decode(String.self, forKey: CodingKeys.seoBannerId)
        self.pageInformation = try! values.decode(PageInformation.self, forKey: CodingKeys.pageInformation)
        self.triggeredRules = try! values.decode(TriggeredRules.self, forKey: CodingKeys.triggeredRules)
        self.endecaCanonical = try! values.decode(String.self, forKey: CodingKeys.endecaCanonical)
        self.baseFacetId = try! values.decode(String.self, forKey: CodingKeys.baseFacetId)
    }
}
