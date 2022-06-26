//
//  sku.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation


/// A struct for decoding a `skus` JSON blob
struct SKU: Decodable {

    private enum CodingKeys: String, CodingKey {
        case media
        case sizeHeadline
        case brandName
        case id
        case availability
        case color
        case swatchUrl
        case code
        case skuTitle
        case dynamicAttributes
        /// WARN:  Dropped unknown `"unitPriceInfo": {},`
        case priceBand
        case size
        case ticketType
        case price
    }

    let media: Media
    let sizeHeadline: String
    let brandName: String
    let id: String
    let availability: Availability
    let color: String
    let swatchUrl: String
    let code: String
    let skuTitle: String
    let dynamicAttributes: [String: String]
    let priceBand: String
    let size: String
    let ticketType: String
    let price: Price

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.media = try! values.decode(Media.self, forKey: CodingKeys.media)
        self.sizeHeadline = try! values.decode(String.self, forKey: CodingKeys.sizeHeadline)
        self.brandName = try! values.decode(String.self, forKey: CodingKeys.brandName)
        self.id = try! values.decode(String.self, forKey: CodingKeys.id)
        self.availability = try! values.decode(Availability.self, forKey: CodingKeys.availability)
        self.color = try! values.decode(String.self, forKey: CodingKeys.color)
        self.swatchUrl = try! values.decode(String.self, forKey: CodingKeys.swatchUrl)
        self.code = try! values.decode(String.self, forKey: CodingKeys.code)
        self.skuTitle = try! values.decode(String.self, forKey: CodingKeys.skuTitle)
        self.dynamicAttributes = try! values.decode([String: String].self, forKey: CodingKeys.dynamicAttributes)
        self.priceBand = try! values.decode(String.self, forKey: CodingKeys.priceBand)
        self.size = try! values.decode(String.self, forKey: CodingKeys.size)
        self.ticketType = try! values.decode(String.self, forKey: CodingKeys.ticketType)
        self.price = try! values.decode(Price.self, forKey: CodingKeys.price)
    }
}
