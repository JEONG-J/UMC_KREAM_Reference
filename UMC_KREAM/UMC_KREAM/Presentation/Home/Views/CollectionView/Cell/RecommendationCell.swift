//
//  RecommendationCell.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/12/24.
//

import UIKit
import SnapKit

// 상품 추천 셀
class RecommendationCell: BaseCollectionCell {
    
    static let identifier: String = "RecommendationCell"
    
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
    
    
    private func changeFont() {
        self.titleText.font = UIFont.systemFont(ofSize: 11.5, weight: .regular)
    }
    
    private func addComponents() {
        [self.imageView, self.titleText].forEach { self.addSubview($0) }
    }
    
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
    
    override func configure(model: any RequiredCellProtocol) {
        guard let recommendProductModel = model as? RecommendProductModel else { return }
        
        self.imageView.image = UIImage(named: recommendProductModel.imageView)
        self.titleText.text = recommendProductModel.titleText
    }
}
