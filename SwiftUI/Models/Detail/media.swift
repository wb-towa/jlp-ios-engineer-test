//
//  media.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding a media JSON blob
///
struct Media: Decodable {

    private enum CodingKeys: String, CodingKey {
        case videos
        case images
    }

    let videos: MediaSources?
    let images: MediaSources?

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.videos = try? values.decode(MediaSources.self, forKey: CodingKeys.videos)
        self.images = try? values.decode(MediaSources.self, forKey: CodingKeys.images)

    }
}

struct MediaSources: Decodable {

    private enum CodingKeys: String, CodingKey {
        case urls
    }

    let urls: [String]?

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.urls = try? values.decode([String].self, forKey: CodingKeys.urls)

    }

}
