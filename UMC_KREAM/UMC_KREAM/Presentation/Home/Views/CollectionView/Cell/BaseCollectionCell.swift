//
//  HomeBaseCollectionCell.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 11/12/24.
//

import UIKit

/// 여러 셀 중 가장 기본이 되는 컴포넌트 셀
class BaseCollectionCell: UICollectionViewCell, ProductCellProtocol {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        
        titleText.text = nil
        subTitleText.text = nil
        
        priceLabel.text = nil
    }
    
    //MARK: - Property
    
    /// 상품 이미지
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    /// 상품 타이틀
    lazy var titleText: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .semibold), UIColor.black)
    
    /// 상품 서브 타이틀
    lazy var subTitleText: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .regular), UIColor.black)
    
    /// 상품 가격
    lazy var priceLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 13, weight: .semibold), UIColor.black)
    
    /// 셀 내부 컴포넌트 값 할당 함수
    func configure(model: any RequiredCellProtocol) {
       print("상속 받은 셀에서 오버라이드 하여 사용할 것!")
    }
    
    
    //MARK: - Function
    
    /// 중복 라벨 처리 함수
    /// - Parameter font: 텍스트 폰트 지정
    /// - Returns: 지정된 폰트 UILabel 반환
    func makeLabel(font: UIFont, _ color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }
    
    
    /// 스태뷰 생성
    /// - Parameter spacing: 간격 조정
    /// - Returns: UIStackView 반환
    func makeStackView(spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.spacing = spacing
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }
    
    /// 이미지의 cornerRadius를 수정할 경우 사용한다
    /// - Parameter cornerRadius: 원하는 값 넣기
    func imageViewCorner(cornerRadius: CGFloat) {
        self.imageView.layer.cornerRadius = cornerRadius
    }
}
