//
//  product.swift
//  jlp-ios-engineer-test
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

///
/// A struct for decoding JSON describing a Product
///
struct Product: Hashable, Decodable {

    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.title == rhs.title
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(productId)
    }


    private enum CodingKeys: String, CodingKey {
        case productId
        case type
        case title
        case code
        case averageRating
        case reviews
        case id
        case image
        case alternativeImageUrls
        case displaySpecialOffer
        case nonPromoMessage
        case defaultSkuId
        case colorSwatches
        case outOfStock
        case isAvailableToOrder
        case emailMeWhenAvailable
        case compare
        case fabric
        case swatchAvailable
        case brand
        case ageRestriction
        case isInStoreOnly
        case isMadeToMeasure
        case isBundle
        case isProductSet
        case dynamicAttributes
        case futureRelease
        case multiSku
        case messaging
        // case variantPriceRange
        case services
        case attributes
        case hiddenAttributes
        case permanentOos
        case defaultParentCategory

    }

    let productId: String
    let type: String
    let title: String
    let code: String
    let averageRating: Float
    let reviews: Int
    let image: String
    let alternativeImageUrls: [String]
    /// WARN: like a special offer to display but name may mean it should be a bool
    /// this would be something to verify in a real world scenario
    let displaySpecialOffer: String?
    let nonPromoMessage: String?
    let defaultSkuId: String
    let colorSwatches: [ColorSwatch]
    let outOfStock: Bool
    let isAvailableToOrder: Bool
    let emailMeWhenAvailable: Bool
    let compare: Bool
    let fabric: String?
    let swatchAvailable: Bool
    let brand: String
    /// WARN: value implies it's boolean that simply comes through as 0 / 1
    /// in a real world scenario, there may be levels of age restriction where
    /// logic is mapped to integer values.
    /// **Example:** 0 (None), 1 (18+), 2 (12+) etc
    let ageRestriction: Int
    let isInStoreOnly: Bool
    let isMadeToMeasure: Bool
    let isBundle: Bool
    let isProductSet: Bool
    /// WARN: Appears to always be a dict of String : String
    /// Could use [String: Any] if that were not true in reality
    let dynamicAttributes: [String: String]
    let futureRelease: Bool
    let multiSku: Bool
    let messaging: [Message]
    // let variantPriceRange
    let services: [Service]
    let attributes: [Attribute]
    let hiddenAttributes: [Attribute]
    let permanentOos: Bool
    let defaultParentCategory: Category

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.productId = try! values.decode(String.self, forKey: CodingKeys.productId)
        self.type = try! values.decode(String.self, forKey: CodingKeys.type)
        self.title = try! values.decode(String.self, forKey: CodingKeys.title)
        self.code = try! values.decode(String.self, forKey: CodingKeys.code)
        self.averageRating = try! values.decode(Float.self, forKey: CodingKeys.averageRating)
        self.reviews = try! values.decode(Int.self, forKey: CodingKeys.reviews)
        self.image = try! values.decode(String.self, forKey: CodingKeys.image)
        self.alternativeImageUrls = try! values.decode([String].self, forKey: CodingKeys.alternativeImageUrls)
        self.displaySpecialOffer = try? values.decode(String.self, forKey: CodingKeys.displaySpecialOffer)
        self.nonPromoMessage = try? values.decode(String.self, forKey: CodingKeys.nonPromoMessage)
        self.defaultSkuId = try! values.decode(String.self, forKey: CodingKeys.defaultSkuId)
        self.colorSwatches = try! values.decode([ColorSwatch].self, forKey: CodingKeys.colorSwatches)
        self.outOfStock = try! values.decode(Bool.self, forKey: CodingKeys.outOfStock)
        self.isAvailableToOrder = try! values.decode(Bool.self, forKey: CodingKeys.isAvailableToOrder)
        self.emailMeWhenAvailable = try! values.decode(Bool.self, forKey: CodingKeys.emailMeWhenAvailable)
        self.compare = try! values.decode(Bool.self, forKey: CodingKeys.compare)
        self.fabric = try? values.decode(String.self, forKey: CodingKeys.fabric)
        self.swatchAvailable = try! values.decode(Bool.self, forKey: CodingKeys.swatchAvailable)
        self.brand = try! values.decode(String.self, forKey: CodingKeys.brand)
        self.ageRestriction = try! values.decode(Int.self, forKey: CodingKeys.ageRestriction)
        self.isInStoreOnly = try! values.decode(Bool.self, forKey: CodingKeys.isInStoreOnly)
        self.isMadeToMeasure = try! values.decode(Bool.self, forKey: CodingKeys.isMadeToMeasure)
        self.isBundle = try! values.decode(Bool.self, forKey: CodingKeys.isBundle)
        self.isProductSet = try! values.decode(Bool.self, forKey: CodingKeys.isProductSet)
        self.dynamicAttributes = try! values.decode([String: String].self, forKey: CodingKeys.dynamicAttributes)
        self.futureRelease = try! values.decode(Bool.self, forKey: CodingKeys.futureRelease)
        self.multiSku = try! values.decode(Bool.self, forKey: CodingKeys.multiSku)
        self.messaging = try! values.decode([Message].self, forKey: CodingKeys.messaging)
        self.services = try! values.decode([Service].self, forKey: CodingKeys.services)
        self.attributes = try! values.decode([Attribute].self, forKey: CodingKeys.attributes)
        self.hiddenAttributes = try! values.decode([Attribute].self, forKey: CodingKeys.hiddenAttributes)
        self.permanentOos = try! values.decode(Bool.self, forKey: CodingKeys.permanentOos)
        self.defaultParentCategory = try! values.decode(Category.self, forKey: CodingKeys.defaultParentCategory)
    }

    func displayImage() -> String? {

        if !self.image.isEmpty {
            return "https:\(self.image)"
        } else if  !self.alternativeImageUrls.isEmpty {
            return "https:\(self.alternativeImageUrls[0])"
        }
        return nil
    }
}
