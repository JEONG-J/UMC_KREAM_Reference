//
//  ProductGridCell.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/12/24.
//

import UIKit
import SnapKit

/// 가로로 스크롤 되면서 보이는 상품 그리드 컬렉션 셀
class ProductGridCell: BaseCollectionCell {
    
    static let identifier: String = "ProductGridCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addStackView()
        addComponents()
        constaints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        purchaseCount.text = nil
        tagButton.setImage(nil, for: .normal)
        
        titleText.text = nil
        subTitleText.text = nil
        
        priceLabel.text = nil
        priceDescription.text = nil
    }
    
    /// 상품 구매 수 라벨
    private lazy var purchaseCount: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 10, weight: .regular), UIColor(red: 0.251, green: 0.272, blue: 0.294, alpha: 1))
    
    
    /// 이미지 백그라운드 랜덤 색상 적용
    private lazy var imageBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 0.6
        )
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    /// 태그 버튼
    private lazy var tagButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    /// "즉시 구매가" 설명 라벨
    private lazy var priceDescription: UILabel = {
        let label = UILabel()
        label.text = "즉시 구매가"
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = UIColor(red: 0.635, green: 0.635, blue: 0.635, alpha: 1)
        return label
    }()
    
    /// 상품 이름 및 설명 스택 뷰
    private lazy var productTitleStack: UIStackView = makeStackView(spacing: 3)
    
    /// 상품 가격 및 "즉시 구매가" 스택 뷰
    private lazy var priceTitleStack: UIStackView = makeStackView(spacing: 2)
    
    
    //MARK: - Function
    
    private func setTagButtonImage(isMark: Bool) -> UIImage {
        if isMark {
            return UIImage(named: "notTag.pdf") ?? UIImage()
        } else {
            return UIImage(named: "tag.pdf") ?? UIImage()
        }
    }
    
    private func addStackView() {
        [self.priceLabel, self.priceDescription].forEach{ priceTitleStack.addArrangedSubview($0) }
        [self.titleText, self.subTitleText].forEach{ productTitleStack.addArrangedSubview($0) }
    }
    
    private func addComponents() {
        [self.imageView, self.purchaseCount, self.tagButton].forEach{ self.imageBackground.addSubview($0) }
        [productTitleStack, priceTitleStack, imageBackground].forEach{ self.addSubview($0) }
    }
    
    private func constaints() {
        /* 상품 배경에 속해 있는 데이터 */
        
        imageBackground.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.right.equalToSuperview().offset(0)
            $0.height.equalTo(142)
        }
        
        purchaseCount.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.right.equalToSuperview().offset(-8)
            $0.width.greaterThanOrEqualTo(48)
            $0.height.equalTo(12)
        }
        
        tagButton.snp.makeConstraints {
            $0.top.equalTo(purchaseCount.snp.bottom).offset(92)
            $0.right.bottom.equalToSuperview().offset(-10)
            $0.width.equalTo(14.2)
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.lessThanOrEqualTo(123)
            $0.height.greaterThanOrEqualTo(30)
        }
        
        /* 상품 배경에 속해 있는 데이터 */
        
        productTitleStack.snp.makeConstraints {
            $0.top.equalTo(imageBackground.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(2)
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualTo(25)
        }
        
        titleText.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(14)
        }
        
        subTitleText.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualTo(14)
        }
        
        priceTitleStack.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(2)
            $0.width.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
    
    override func configure(model: any RequiredCellProtocol) {
        guard let productGridModel = model as? ProductGridModel else { return }
        
        self.imageView.image = UIImage(named: productGridModel.imageView)?.downSample(scale: 0.3)
        self.purchaseCount.text = productGridModel.purchaseCnt
        self.tagButton.setImage(setTagButtonImage(isMark: productGridModel.selectedTag), for: .normal)

        self.titleText.text = productGridModel.titleText
        self.subTitleText.text = productGridModel.subTitleText
        
        self.priceLabel.text = productGridModel.priceText
        self.priceDescription.text = productGridModel.priceSubText
    }
    
}
