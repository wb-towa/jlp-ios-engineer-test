//
//  ContentView.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject var srProvider = SearchResultProvider()

    let layout = [
        GridItem(.adaptive(minimum: 300, maximum: 300))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 0) {
                    ForEach(srProvider.results.products, id: \.self) { product in
                        SearchResultEntry(product: product)
                    }
                }
            }
            .navigationTitle(srProvider.title())
            .frame(maxWidth: .infinity)
            .background(.white)
            .foregroundColor(.black)
        }
        .navigationViewStyle(.stack)
    }
}
