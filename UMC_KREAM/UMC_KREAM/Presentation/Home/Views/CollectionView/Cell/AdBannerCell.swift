//
//  AdBannerCell.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/12/24.
//

import UIKit
import SnapKit

/// 광고 사진 배너 셀
class AdBannerCell: BaseCollectionCell {
    
    static let identifier: String = "AdBannerCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
    }
    
    private func addComponents() {
        self.addSubview(imageView)
    }
    
    private func constraints() {
        self.imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func configure(model: any RequiredCellProtocol) {
        guard let bannerModel = model as? BannerModel else { return }
        
        self.imageView.image = UIImage(named: bannerModel.imageView)
    }
}
