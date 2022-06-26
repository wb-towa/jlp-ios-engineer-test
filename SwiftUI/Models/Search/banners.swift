//
//  banners.swift
//  jlp-ios-engineer-testTests
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
///    {
///        "topBannerId": "offers/bh-offers-aug-2021/bho_beauty_pt_230821111111",
///        "blockBannerId": "dishwashers-hyb-261018",
///        "seoBannerId": "20112019/ado"
///    }
///
struct Banners: Decodable {

    private enum CodingKeys: String, CodingKey {
        case topBannerId
        case blockBannerId
        case seoBannerId
    }

    let topBannerId: String
    let blockBannerId: String
    let seoBannerId: String

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.topBannerId = try! values.decode(String.self, forKey: CodingKeys.topBannerId)
        self.blockBannerId = try! values.decode(String.self, forKey: CodingKeys.blockBannerId)
        self.seoBannerId = try! values.decode(String.self, forKey: CodingKeys.seoBannerId)
    }
}
