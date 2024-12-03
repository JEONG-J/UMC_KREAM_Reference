//
//  SearchResponse.swift
//  UMC_KREAM
//
//  Created by 7기 중앙 iOS 파트장 정의찬/제옹 on 12/2/24.
//

import Foundation

/// 워크북 명세서를 통해 만든 데이터 모델
struct SearchResponse: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Double
    let dimensions: Dimensions
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
}

struct Dimensions: Codable {
    let width: Double
    let height: Double
    let depth: Double
}

struct Review: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String
}

struct Meta: Codable {
    let createdAt: String
    let updatedAt: String
    let barcode: String
    let qrCode: String
}
