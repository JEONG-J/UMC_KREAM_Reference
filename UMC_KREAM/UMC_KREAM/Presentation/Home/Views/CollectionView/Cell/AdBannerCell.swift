//
//  AdBannerCell.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 11/12/24.
//

import UIKit
import SnapKit

/// 광고 사진 배너 셀
class AdBannerCell: BaseCollectionCell {
    
    static let identifier: String = "AdBannerCell"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// BaseCollectionCell의 prepareForReuse()를 오버라이드합니다.
    override func prepareForReuse() {
        self.imageView.image = nil
    }
    
    // MARK: - Function
    
    /// 컴포넌트 생성
    private func addComponents() {
        self.addSubview(imageView)
    }
    
    /// 제약 조건 설정
    private func constraints() {
        self.imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    /// RequiredCellProtocol 상속을 받는 모델 값을 파라미터로 전달하여 해당 셀의 값 넣어준다.
    /// - Parameter model: RequiredCellProtocol을 상속받는 모델
    override func configure(model: any RequiredCellProtocol) {
        guard let bannerModel = model as? BannerModel else { return }
        
        /* KingfisherExtend.swift 파일을 참고해주세요! */
        self.imageView.setImage(from: bannerModel.imageView)
    }
}
