//
//  SearchResultProvider.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 26/06/2022.
//

import Foundation


final class SearchResultProvider: NSObject, ObservableObject {

    @Published var results: SearchResults

    init(resource: String="listing") {
        let bundle = Bundle(for: Self.self)
        let jsonPath = bundle.path(forResource: resource, ofType: "json")
        let fileManager = FileManager.default

        let jsonData = fileManager.contents(atPath: jsonPath!)

        results = try! JSONDecoder().decode(SearchResults.self, from: jsonData!)

    }

    func title() -> String {
        if let category = results.crumbs.last {
            return "\(category.displayName) (\(results.results))"
        }
        return "error"
    }
}
