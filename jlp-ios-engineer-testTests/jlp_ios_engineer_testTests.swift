//
//  jlp_ios_engineer_testTests.swift
//  jlp-ios-engineer-testTests
//
//  Created by Chris Thomas on 11/05/2022.
//

import XCTest
@testable import jlp_ios_engineer_test

class jlp_ios_engineer_testTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Basic Search Result Model validation
    func testSearchResultsJSONParsing() throws {
        let bundle = Bundle(for: Self.self)
        let jsonPath = bundle.path(forResource: "listing", ofType: "json")
        let fileManager = FileManager.default

        let jsonData = fileManager.contents(atPath: jsonPath!)

        let resultsJson = try? JSONDecoder().decode(SearchResults.self, from: jsonData!)

        XCTAssertNotNil(resultsJson, "json decoding of search results failed")

        if let results = resultsJson {
            XCTAssertEqual(results.products.count, 24)
            XCTAssertEqual(results.results, 74)
            XCTAssertEqual(results.pagesAvailable, 4)
        }
    }

    // Basic facet validation
    func testFacetJSONParsing() throws {
        let bundle = Bundle(for: Self.self)
        let jsonPath = bundle.path(forResource: "facet", ofType: "json")
        let fileManager = FileManager.default

        let jsonData = fileManager.contents(atPath: jsonPath!)

        let facetJson = try? JSONDecoder().decode(Facet.self, from: jsonData!)

        XCTAssertNotNil(facetJson, "json decoding of facet failed")

        if let facet = facetJson {
            XCTAssertEqual(facet.name, "Stock Availability")
            XCTAssertEqual(facet.type, "Single")

            XCTAssertEqual(facet.filterTypes.count, 2)
            XCTAssertEqual(facet.details.count, 1)

            XCTAssertEqual(facet.filterTypes,  ["AlwaysShow","AboveSeo"])
        }
    }

    // Basic Details model valdation
    func testDetailJSONParsing() throws {
        let bundle = Bundle(for: Self.self)
        let jsonPath = bundle.path(forResource: "detail", ofType: "json")
        let fileManager = FileManager.default

        let jsonData = fileManager.contents(atPath: jsonPath!)

        let detailJson = try? JSONDecoder().decode(ProductInformation.self, from: jsonData!)

        XCTAssertNotNil(detailJson, "json decoding of detail failed")

        if let detail = detailJson {
            XCTAssertEqual(detail.skus.count, 1)
            XCTAssertEqual(detail.crumbs.count, 3)
            XCTAssertEqual(detail.deliveries.count, 1)
            XCTAssertEqual(detail.details.buyingGuides.count, 1)
            XCTAssertEqual(detail.details.featuredArticles.count, 1)
        }
    }

    // Tests for search provider functions
    func testSearchResultProvider() throws {
        // Contains missing data where models have functions created for operating on that data
        let provider = SearchResultProvider(resource: "searchresult-provider-errors")

        XCTAssertEqual(provider.title(), "error")
        XCTAssertEqual(provider.results.products.count, 1)
        XCTAssertNil(provider.results.products[0].displayImage(), "unexpected display image url")
    }

    // Tests for detail provider functions
    func testSDetailProvider() throws {
        let provider = DetailProvider(resource: "detail-provider-errors")

        XCTAssertNil(provider.productInformation.guarantees(), "unexpected guarantee information returned")
        XCTAssertNil(provider.productInformation.productImage(), "unexpected product image url")
    }

}
