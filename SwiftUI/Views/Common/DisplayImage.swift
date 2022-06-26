//
//  DisplayImage.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 26/06/2022.
//

import SwiftUI

struct DisplayImage: View {

    let imageURL: String

    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .aspectRatio(contentMode: .fit)
    }
}
