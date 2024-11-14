//
//  ProductModel.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/12/24.
//

import Foundation

struct BannerModel: RequiredCellProtocol {
    var imageView: String
}

struct RecommendProductModel: RequiredCellProtocol {
    var imageView: String
    var titleText: String
}

struct ProductGridModel: RequiredCellProtocol {
    var imageView: String
    var purchaseCnt: String
    var selectedTag: Bool
    var titleText: String
    var subTitleText: String
    var priceText: String
    var priceSubText: String
}

struct UserStoryModel: RequiredCellProtocol {
    var imageView: String
    var userName: String
}

final class HomeCellModel {
    static let userStoryData: [UserStoryModel] = [
        .init(imageView: "userCell1", userName: "@ass"),
        .init(imageView: "userCell2", userName: "@asssd"),
        .init(imageView: "userCell3", userName: "@aeggsa"),
        .init(imageView: "userCell4", userName: "@ahge2"),
        .init(imageView: "userCell5", userName: "@ajfdc4223")
        ]
    
    static let productGridData: [ProductGridModel] = [
        .init(imageView: "GridCell1", purchaseCnt: "거래 12.8만", selectedTag: false, titleText: "MLB", subTitleText: "청키라이너 뉴욕양키스", priceText: "139,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell2", purchaseCnt: "거래 1.8만", selectedTag: true, titleText: "나이키", subTitleText: "alskdjakshjdakjsdhajksdhajksdjkasdhajksdhkasalksdjk", priceText: "139,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell3", purchaseCnt: "거래 11.8만", selectedTag: true, titleText: "아디다스", subTitleText: "sdfsdgffdhbcv", priceText: "139,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell4", purchaseCnt: "거래 89.8만", selectedTag: false, titleText: "뉴발란스", subTitleText: "asdfwr3xcvcv", priceText: "139,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell5", purchaseCnt: "거래 54.8만", selectedTag: false, titleText: "어딘가 브랜드", subTitleText: "sdfs", priceText: "139,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell6", purchaseCnt: "거래 3.8만", selectedTag: true, titleText: "브랜드 또 모있지..", subTitleText: "", priceText: "139,000원", priceSubText: "즉시 구매가")
    ]
    
    static let recommendProductData: [RecommendProductModel] = [
        .init(imageView: "homeCell1", titleText: "크림 드로우"),
        .init(imageView: "homeCell2", titleText: "실시간 차트"),
        .init(imageView: "homeCell3", titleText: "남성 추천"),
        .init(imageView: "homeCell4", titleText: "여성 추천"),
        .init(imageView: "homeCell5", titleText: "색다른 추천"),
        .init(imageView: "homeCell6", titleText: "정가 아래"),
        .init(imageView: "homeCell7", titleText: "윤세 24AW"),
        .init(imageView: "homeCell8", titleText: "올해의 베스트"),
        .init(imageView: "homeCell9", titleText: "10월 베네핏"),
        .init(imageView: "homeCell10", titleText: "아크네 선물")
    ]
    
    static let bannerData: [BannerModel] = [.init(imageView: "adverImage")]
}
