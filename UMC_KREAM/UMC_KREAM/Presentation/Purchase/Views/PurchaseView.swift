//
//  PurchaseView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit

/// 상품 구매 뷰
class PurchaseView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        addStackView()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    /// 셀에서 선택한 이미지 뷰
    public lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    /// 상품 컬렉션 뷰
    public lazy var productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 53, height: 53)
        layout.minimumInteritemSpacing = 8
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PurchaseCell.self, forCellWithReuseIdentifier: PurchaseCell.identifier)
        
        collection.backgroundColor = .white
        return collection
    }()
    
    private lazy var priceTitleLabel: UILabel = makeLabel("즉시 구매가", UIFont.systemFont(ofSize: 12, weight: .light), color: UIColor.black)
    private lazy var priceLabel: UILabel = makeLabel("228,000원", UIFont.systemFont(ofSize: 20, weight: .semibold), color: UIColor.black)
    
    public lazy var productName: UILabel = makeLabel("Matin Kim Logo Coating Jumprt", UIFont.systemFont(ofSize: 16, weight: .regular), color: UIColor.black)
    public lazy var productDescription: UILabel = makeLabel("마뗑킴 로고 코팅 점퍼 블랙", UIFont.systemFont(ofSize: 12, weight: .regular), color: UIColor(red: 0.612, green: 0.612, blue: 0.612, alpha: 1))
    
    private lazy var tagBtn: UIButton = {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "notTag")
        configuration.imagePlacement = .top
        configuration.imagePadding = 1
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        configuration.attributedTitle = AttributedString("2,122", attributes: AttributeContainer([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 12, weight: .regular)]))
        
        btn.configuration = configuration
        return btn
    }()
    
    public lazy var leftPurchaseBtn: PurchaseButton = makeBottomBtn(price: "345,000", sub: "즉시 구매가", type: .purchase)
    public lazy var rightSalesBtn: PurchaseButton = makeBottomBtn(price: "396,000", sub: "즉시 판매가", type: .sales)
    private lazy var bottomBackgroundView: PurchaseBottomBackground = PurchaseBottomBackground()
    
    private lazy var priceStack: UIStackView = makeStack(spacing: 4, axis: .vertical)
    private lazy var productStack: UIStackView = makeStack(spacing: 6, axis: .vertical)
    private lazy var bottomButtonStack: UIStackView = makeStack(spacing: 6, axis: .horizontal)
    
    // MARK: - MakeFunction
    private func makeBottomBtn(price: String, sub: String, type: PurchaseButtonType) -> PurchaseButton {
        let btn = PurchaseButton(frame: .zero, btnType: type)
        btn.priceLabel.text = price
        btn.subLabel.text = sub
        btn.isUserInteractionEnabled = true
        return btn
    }
    
    private func makeLabel(_ text: String, _ font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }
    
    private func makeStack(spacing: CGFloat, axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.spacing = spacing
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        return stack
    }
    
    // MARK: - Constaints & Add Function
    
    private func addStackView() {
        [priceTitleLabel, priceLabel].forEach{ self.priceStack.addArrangedSubview($0) }
        [productName, productDescription].forEach{ self.productStack.addArrangedSubview($0) }
        [leftPurchaseBtn, rightSalesBtn].forEach{ self.bottomButtonStack.addArrangedSubview($0) }
    }
    
    private func addComponents() {
        [productImageView, productCollectionView].forEach{ self.addSubview($0) }
        [priceStack, productStack, bottomBackgroundView].forEach{ self.addSubview($0) }
        [tagBtn, bottomButtonStack].forEach{ self.bottomBackgroundView.addSubview($0) }
    }
    
    private func constraints() {
        productImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(5)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(373)
        }
        
        productCollectionView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        priceStack.snp.makeConstraints {
            $0.top.equalTo(productCollectionView.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(16)
            $0.width.greaterThanOrEqualTo(50)
            $0.height.equalTo(42)
        }
        
        productStack.snp.makeConstraints {
            $0.top.equalTo(priceStack.snp.bottom).offset(18)
            $0.left.equalToSuperview().offset(16)
            $0.width.greaterThanOrEqualTo(80)
            $0.height.equalTo(40)
        }
        
        bottomBackgroundView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(95)
        }
        
        tagBtn.snp.makeConstraints {
            $0.left.equalToSuperview().offset(19)
            $0.top.equalToSuperview().offset(12)
            $0.height.greaterThanOrEqualTo(30)
            $0.width.greaterThanOrEqualTo(20)
        }
        
        bottomButtonStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(tagBtn.snp.right).offset(19)
            $0.width.equalTo(300)
            $0.height.equalTo(49)
        }
        
        leftPurchaseBtn.snp.makeConstraints {
            $0.width.equalTo(147)
            $0.height.equalTo(49)
        }
        
        rightSalesBtn.snp.makeConstraints {
            $0.width.equalTo(147)
            $0.height.equalTo(49)
        }
    }
    
}
