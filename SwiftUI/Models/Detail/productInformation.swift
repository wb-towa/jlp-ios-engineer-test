//
//  ProductInformation.swift
//  jlp-ios-engineer-testTests
//
//  Created by William Baer on 25/06/2022.
//

import Foundation

/// A struct for decoding a product detail JSON blob
///
struct ProductInformation: Decodable {

    /// NOTE: Ignoring empty array values from `detail.json` mock file

    private enum CodingKeys: String, CodingKey {
        case emailMeWhenAvailable
        case numberOfReviews
        case productId
        case ageRestriction
        case releaseDateTimestamp
        case details
        case averageRating
        case skus
        case templateType
        case defaultSku
        case isFBL
        case code
        case deliveries
        case type
        case title
        case seoURL
        case isAsafShape
        case defaultCategory
        case nonPromoMessage
        case price
        case specialOffers
        case brand
        case dynamicAttributes
        case additionalServices
        case media
        case displaySpecialOffer
        case lifeCycleState
        case crumbs
        case storeOnly
    }

    let emailMeWhenAvailable: Bool
    let numberOfReviews: Int
    let productId: String
    let ageRestriction: Int
    let releaseDateTimestamp: Int
    let details: Details
    let averageRating: Float
    let skus: [SKU]
    let templateType :String
    let defaultSku: String
    let isFBL: Bool
    let code: String
    let deliveries: [Delivery]
    let type: String
    let title: String
    let seoURL: String
    let isAsafShape: Bool
    let defaultCategory: Category
    let nonPromoMessage: String
    let price: Price
    let specialOffers: SpecialOffers
    let brand: Brand
    let dynamicAttributes: [String: String]
    let additionalServices: AdditionalServices
    let media: Media
    let displaySpecialOffer: String
    let lifeCycleState: String
    let crumbs: [Crumb]
    let storeOnly:  Bool

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.emailMeWhenAvailable = try! values.decode(Bool.self, forKey: CodingKeys.emailMeWhenAvailable)
        self.numberOfReviews = try! values.decode(Int.self, forKey: CodingKeys.numberOfReviews)
        self.productId = try! values.decode(String.self, forKey: CodingKeys.productId)
        self.ageRestriction = try! values.decode(Int.self, forKey: CodingKeys.ageRestriction)
        self.releaseDateTimestamp = try! values.decode(Int.self, forKey: CodingKeys.releaseDateTimestamp)
        self.details = try! values.decode(Details.self, forKey: CodingKeys.details)
        self.averageRating = try! values.decode(Float.self, forKey: CodingKeys.averageRating)
        self.skus = try! values.decode([SKU].self, forKey: CodingKeys.skus)
        self.templateType = try! values.decode(String.self, forKey: CodingKeys.templateType)
        self.defaultSku = try! values.decode(String.self, forKey: CodingKeys.defaultSku)
        self.isFBL = try! values.decode(Bool.self, forKey: CodingKeys.isFBL)
        self.code = try! values.decode(String.self, forKey: CodingKeys.code)
        self.deliveries = try! values.decode([Delivery].self, forKey: CodingKeys.deliveries)
        self.type = try! values.decode(String.self, forKey: CodingKeys.type)
        self.title = try! values.decode(String.self, forKey: CodingKeys.title)
        self.seoURL = try! values.decode(String.self, forKey: CodingKeys.seoURL)
        self.isAsafShape = try! values.decode(Bool.self, forKey: CodingKeys.isAsafShape)
        self.defaultCategory = try! values.decode(Category.self, forKey: CodingKeys.defaultCategory)
        self.nonPromoMessage = try! values.decode(String.self, forKey: CodingKeys.nonPromoMessage)
        self.price = try! values.decode(Price.self, forKey: CodingKeys.price)
        self.specialOffers = try! values.decode(SpecialOffers.self, forKey: CodingKeys.specialOffers)
        self.brand = try! values.decode(Brand.self, forKey: CodingKeys.brand)
        self.dynamicAttributes = try! values.decode([String: String].self, forKey: CodingKeys.dynamicAttributes)
        self.additionalServices = try! values.decode(AdditionalServices.self, forKey: CodingKeys.additionalServices)
        self.media = try! values.decode(Media.self, forKey: CodingKeys.media)
        self.displaySpecialOffer = try! values.decode(String.self, forKey: CodingKeys.displaySpecialOffer)
        self.lifeCycleState = try! values.decode(String.self, forKey: CodingKeys.lifeCycleState)
        self.crumbs = try! values.decode([Crumb].self, forKey: CodingKeys.crumbs)
        self.storeOnly = try! values.decode(Bool.self, forKey: CodingKeys.storeOnly)
    }

    func guarantees() -> String? {
        if !self.additionalServices.includedServices.isEmpty {
            return self.additionalServices.includedServices.joined(separator: "\n")
        }
        return nil
    }

    func productImage() -> String? {
        if let imageUrl = self.skus.first?.media.images?.urls?.first {
            return "https:\(imageUrl)"
        }
        return nil
    }
}
