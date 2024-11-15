//
//  ProductModel.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/12/24.
//

import Foundation

/// 홈 탭의 광고 배너, 1번째 섹션
struct BannerModel: RequiredCellProtocol {
    var imageView: String
}

/// 홈 탭의 추천 상품 데이터, 2번째 섹션
struct RecommendProductModel: RequiredCellProtocol {
    var imageView: String
    var titleText: String
}

/// 홈 탭의 판매 상품 데이터, 3번째 섹션
struct ProductGridModel: RequiredCellProtocol {
    var imageView: String
    var purchaseCnt: String
    var selectedTag: Bool
    var titleText: String
    var subTitleText: String
    var priceText: String
    var priceSubText: String
}

/// 홈 탭의 유저 스토리형 데이터, 4번째 섹션
struct UserStoryModel: RequiredCellProtocol {
    var imageView: String
    var userName: String
}

// MARK: - Dummy Data

/// 홈 탭의 섹션셜 더미데이터
final class HomeCellModel {
    /* 유저 스토리형 데이터, 4번째 섹션 데이터 */
    static let userStoryData: [UserStoryModel] = [
        .init(imageView: "userCell1", userName: "@kakain^.^"),
        .init(imageView: "userCell2", userName: "@UMC-7th"),
        .init(imageView: "userCell3", userName: "@thosan"),
        .init(imageView: "userCell4", userName: "@londonHuman"),
        .init(imageView: "userCell5", userName: "@Faker")
        ]
    
    /* 판매 상품 데이터, 3번째 섹션 데이터 */
    static let productGridData: [ProductGridModel] = [
        .init(imageView: "GridCell1", purchaseCnt: "거래 12.8만", selectedTag: false, titleText: "MLB", subTitleText: "청키라이너 뉴욕양키스", priceText: "139,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell2", purchaseCnt: "거래 1.8만", selectedTag: true, titleText: "나이키", subTitleText: "Jordan 1 Retro High OG Yellow", priceText: "139,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell3", purchaseCnt: "거래 11.8만", selectedTag: true, titleText: "아디다스", subTitleText: "Human MASEW", priceText: "228,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell4", purchaseCnt: "거래 89.8만", selectedTag: false, titleText: "뉴발란스", subTitleText: "그냥 어떤 물품 유명함..", priceText: "2,000,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell5", purchaseCnt: "거래 54.8만", selectedTag: false, titleText: "어딘가 브랜드", subTitleText: "설명 뭐 넣을까요..!", priceText: "421,991,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell6", purchaseCnt: "거래 3.8만", selectedTag: true, titleText: "브랜드 또 모있지..", subTitleText: "하하하하 그냥 안 쓸래요", priceText: "1,000원", priceSubText: "즉시 구매가")
    ]
    
    /* 추천 상품 뎅터, 2번째 섹션 데이터 */
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
    
    /* 광고 배너 데이터, 1번째 섹션 데이터 */
    static let bannerData: [BannerModel] = [.init(imageView: "adverImage")]
}
