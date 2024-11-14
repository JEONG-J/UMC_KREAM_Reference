//
//  PurchaseSelectSizeView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit
import SnapKit

class PurchaseSelectSizeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addStackView()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "purchase1")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = makeLabel("aaaaaa", UIFont.systemFont(ofSize: 14, weight: .regular), color: .black)
    private lazy var productDescription: UILabel = makeLabel("bbbbb", UIFont.systemFont(ofSize: 12, weight: .regular), color: .lightGray)
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SizeCell.self, forCellWithReuseIdentifier: SizeCell.identifier)
        
        return collectionView
    }()
    
    public lazy var leftSpeedBtn: ShippingButton = makeBottomBtn(price: "345,000", type: .speed)
    public lazy var rightNormalBtn: ShippingButton = makeBottomBtn(price: "407,000", type: .normal)
    private lazy var bottomBackgroundView: PurchaseBottomBackground = PurchaseBottomBackground()
    
    private lazy var productInfoStack: UIStackView = makeStackView(spacing: 4, axis: .vertical)
    private lazy var bottomButtonStack: UIStackView = makeStackView(spacing: 6, axis: .horizontal)
    
    public func changeValue(data: ReceivePurchaseData) {
        self.productImageView.image = data.image
        self.productNameLabel.text = data.productName
        self.productDescription.text = data.prodcutDescription
    }
    
    private func makeLabel(_ text: String, _ font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }
    
    private func makeBottomBtn(price: String, type: ShippingButtonType) -> ShippingButton {
        let btn = ShippingButton(frame: .zero, btnType: type)
        btn.priceLabel.text = price
        btn.isUserInteractionEnabled = true
        return btn
    }
    
    private func makeStackView(spacing: CGFloat, axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.spacing = spacing
        stack.distribution = .equalSpacing
        return stack
    }
    
    private func addStackView() {
        [productNameLabel, productDescription].forEach{ self.productInfoStack.addArrangedSubview($0) }
        [leftSpeedBtn, rightNormalBtn].forEach{ self.bottomButtonStack.addArrangedSubview($0) }
    }
    
    private func addComponents() {
        [productImageView, productInfoStack, collectionView, bottomBackgroundView].forEach{ self.addSubview($0) }
        [bottomButtonStack].forEach{ self.bottomBackgroundView.addSubview($0) }
    }
    
    private func constraints() {
        productImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(5)
            $0.left.equalToSuperview().offset(16)
            $0.width.height.equalTo(91)
        }
        
        productInfoStack.snp.makeConstraints {
            $0.centerY.equalTo(productImageView.snp.centerY)
            $0.left.equalTo(productImageView.snp.right).offset(15)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(35)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(35)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.height.greaterThanOrEqualTo(115)
        }
        
        bottomBackgroundView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(95)
        }
        
        bottomButtonStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(342)
            $0.height.equalTo(52)
        }
        
        leftSpeedBtn.snp.makeConstraints {
            $0.width.equalTo(168)
            $0.height.equalTo(52)
        }
        
        rightNormalBtn.snp.makeConstraints {
            $0.width.equalTo(168)
            $0.height.equalTo(52)
        }
    }
}
