//
//  PurchaseModel.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import Foundation

/// 상품 구매 뷰, 점퍼 데이터
struct PurchaseModel: RequiredCellProtocol {
    var imageView: String
    var productName: String
}

// MARK: - DummyData

final class PurchaseData {
    static let purchaseData: [PurchaseModel] = [
        .init(imageView: "purchase1", productName: "마뗑킴 로고 코팅 점퍼 블루"),
        .init(imageView: "purchase2", productName: "마뗑킴 로고 코팅 점퍼 퍼플"),
        .init(imageView: "purchase3", productName: "마뗑킴 로고 코팅 점퍼 청록"),
        .init(imageView: "purchase4", productName: "마뗑킴 로고 코팅 점퍼 자두"),
        .init(imageView: "purchase5", productName: "마뗑킴 로고 코팅 점퍼 빨강"),
        .init(imageView: "purchase6", productName: "마뗑킴 로고 코팅 점퍼 갈색"),
        .init(imageView: "purchase7", productName: "마뗑킴 로고 코팅 점퍼 블랙")
    ]
}
