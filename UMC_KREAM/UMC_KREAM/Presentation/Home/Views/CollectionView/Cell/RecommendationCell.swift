//
//  RecommendationCell.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 11/12/24.
//

import UIKit
import SnapKit

// 상품 추천 셀
class RecommendationCell: BaseCollectionCell {
    
    static let identifier: String = "RecommendationCell"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        changeFont()
        addComponents()
        constraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
        self.titleText.text = nil
    }
    
    //MARK: - Function
    
    /// BaseCollectionCell에서의 폰트를 재수정
    private func changeFont() {
        self.titleText.font = UIFont.systemFont(ofSize: 11.5, weight: .regular)
    }
    
    /// 컴포넌트 추가
    private func addComponents() {
        [self.imageView, self.titleText].forEach { self.addSubview($0) }
    }
    
    /// 제약 조건 설정
    private func constraints() {
        self.imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(61)
        }
        
        self.titleText.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(6)
            $0.centerX.equalTo(imageView.snp.centerX)
            $0.width.lessThanOrEqualTo(65)
            $0.height.equalTo(14)
        }
    }
    
    /// RequiredCellProtocol 상속을 받는 모델 값을 파라미터로 전달하여 해당 셀의 값 넣어준다.
    /// - Parameter model: RequiredCellProtocol을 상속받는 모델
    override func configure(model: any RequiredCellProtocol) {
        guard let recommendProductModel = model as? RecommendProductModel else { return }
        
        self.imageView.image = UIImage(named: recommendProductModel.imageView)
        self.titleText.text = recommendProductModel.titleText
    }
}
