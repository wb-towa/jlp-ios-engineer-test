//
//  colourSwatches.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding JSON with this structure:
///
/// {
///     "color": "",
///     "basicColor": "",
///     "colorSwatchUrl": "//johnlewis.scene7.com/is/image/JohnLewis/240251294alt1?cropN=0.49473684210526314,0.4926315789473684,0.04421052631578947,0.04421052631578947",
///     "imageUrl": "//johnlewis.scene7.com/is/image/JohnLewis/240251294?",
///     "isAvailable": true,
///     "skuId": "240251294",
///     "id": "f3c2e1ca-9004-5d15-aa6a-3c182186cc7a",
///     "isColorOfDefaultVariant": true
/// }
///
/// Assumptions:
/// - skuId will always be a numeric value
///
struct ColorSwatch: Decodable {

    private enum CodingKeys: String, CodingKey {
        case color
        case basicColor
        case colorSwatchUrl
        case imageUrl
        case isAvailable
        case skuId
        case id
        case isColorOfDefaultVariant
    }

    let color: String?
    let basicColor: String?
    let colorSwatchUrl: URL
    let imageUrl: URL
    let isAvailable: Bool
    let skuId: String
    let id: String
    let isColorOfDefaultVariant: Bool

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.color = try? values.decode(String.self, forKey: CodingKeys.color)

        self.basicColor = try? values.decode(String.self, forKey: CodingKeys.basicColor)
        self.colorSwatchUrl = try! values.decode(URL.self, forKey: CodingKeys.colorSwatchUrl)
        self.imageUrl = try! values.decode(URL.self, forKey: CodingKeys.imageUrl)
        self.isAvailable = try! values.decode(Bool.self, forKey: CodingKeys.isAvailable)
        self.skuId = try! values.decode(String.self, forKey: CodingKeys.skuId)
        self.id = try! values.decode(String.self, forKey: CodingKeys.id)
        self.isColorOfDefaultVariant = try! values.decode(Bool.self, forKey: CodingKeys.isColorOfDefaultVariant)
    }
}
