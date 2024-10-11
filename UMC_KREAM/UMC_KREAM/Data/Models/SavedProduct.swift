//
//  SavedProduct.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/11/24.
//

import Foundation

struct SavedProduct {
    let imageName: String
    let description: Description
    let price: Int
}

struct Description {
    let title: String
    let subTitle: String
}

final class SavedProductData {
    static let datalist: [SavedProduct] = [
        SavedProduct(imageName: "1.png", description: Description(title: "에베레스트 다이아 반지", subTitle: "에베레스트 올라가서 다이아 구하고 만든 반지!! 과연 이것을 누가 사갈것인가??"), price: 1292999000),
        SavedProduct(imageName: "2.png", description: Description(title: "애기 신발", subTitle: "우리 아기가 신으면 정말 잘 어울리 거 같은 초미니 신발!!"), price: 12000),
        SavedProduct(imageName: "3.png", description: Description(title: "남성 헬창복", subTitle: "너 헬창이니?? 그럼 당장 사서 입어 핏 미쳐~"), price: 90000),
        SavedProduct(imageName: "4.png", description: Description(title: "코딩 바지", subTitle: "컴퓨터 앞에 앉아서 코딩 하는 너,, 너를 위한 바지야 그냥 입고 코딩해봐 그럼 잘될걸??"), price: 1292999000),
        SavedProduct(imageName: "5.png", description: Description(title: "아디다스다 겨울 신발", subTitle: "사실 아디다스가 아닐지도 모르는 신발 하지만 겨울 신발인건 맞아요!! 따뜻해요!!"), price: 120000),
        SavedProduct(imageName: "6.png", description: Description(title: "손오공이 잃어버린 머리띠", subTitle: "손오공이 장난치다가 머리띠를 어딘가 숨겨뒀던 역사속 물건!!"), price: 120000000),
        SavedProduct(imageName: "7.png", description: Description(title: "커플 반지", subTitle: "이제 슬슬 마련하시죠?? 정말 잘 어울릴거에요!"), price: 111111),
        SavedProduct(imageName: "8.png", description: Description(title: "그냥 신발", subTitle: "헐값 떨이요~"), price: 1989)
    ]
}
