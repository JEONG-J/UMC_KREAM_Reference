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
    
    /// 하낭의 상품에 대해 다른 색상의 상품 이미지 처리 컬렉션 뷰
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
    
    /// 상품의 가격 위에 위치한 라벨, 피그마 디자인에서 "즉시 구매가"로 위치함
    private lazy var priceTitleLabel: UILabel = makeLabel("즉시 구매가", UIFont.systemFont(ofSize: 12, weight: .light), color: UIColor.black)
    
    /// 상품의 가격 라벨
    private lazy var priceLabel: UILabel = makeLabel("228,000원", UIFont.systemFont(ofSize: 20, weight: .semibold), color: UIColor.black)
    
    /// 상품의 이름 라벨
    public lazy var productName: UILabel = makeLabel("Matin Kim Logo Coating Jumprt", UIFont.systemFont(ofSize: 16, weight: .regular), color: UIColor.black)
    
    /// 상품의 설명, 피그마 디자인상 점퍼 색상을 보이는 라벨
    public lazy var productDescription: UILabel = makeLabel("마뗑킴 로고 코팅 점퍼 블랙", UIFont.systemFont(ofSize: 12, weight: .regular), color: UIColor(red: 0.612, green: 0.612, blue: 0.612, alpha: 1))
    
    /// 하단 백그라운드 뷰 내부의 태그 버튼
    private lazy var tagBtn: UIButton = {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "notTag")
        configuration.imagePlacement = .top
        configuration.imagePadding = 1
        
        /*
         내부 영역 지정 안하면 기본값으로 지정들어가서 버튼 하나가 차지하는 공간이 커집니다.
         그래서 지정 안하면, 옆에 위치한 커스텀 버튼이 차지하는 공간의 수치를 잘 입력해도 피그마에 보이는 것처럼 안나타날 수 있습니다!
         */
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        configuration.attributedTitle = AttributedString("2,122", attributes: AttributeContainer([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 12, weight: .regular)]))
        
        btn.configuration = configuration
        return btn
    }()
    
    /// 하단 버튼 왼쪽 즉시 구매 버튼
    public lazy var leftPurchaseBtn: PurchaseButton = makeBottomBtn(price: "345,000", sub: "즉시 구매가", type: .purchase)
    
    /// 하단 버튼 오른쪽 즉시 판매 버튼
    public lazy var rightSalesBtn: PurchaseButton = makeBottomBtn(price: "396,000", sub: "즉시 판매가", type: .sales)
    
    /// 하단의 태그 및 버튼들을 담는 백그라운드 뷰
    private lazy var bottomBackgroundView: PurchaseBottomBackground = PurchaseBottomBackground()
    
    /// priceTitleLabel + priceLabel 담는 스택
    private lazy var priceStack: UIStackView = makeStack(spacing: 4, axis: .vertical)
    
    /// productName + productDescription 담는 스택
    private lazy var productStack: UIStackView = makeStack(spacing: 6, axis: .vertical)
    
    /// 하단 커스텀 버튼 2개 담는 스택
    private lazy var bottomButtonStack: UIStackView = makeStack(spacing: 6, axis: .horizontal)
    
    // MARK: - MakeFunction
    
    /// 즉시 판매가 또는 즉시 구매가 버튼 생성
    /// - Parameters:
    ///   - price: 버튼 내부 가격
    ///   - sub: 즉시 판매가 또는 즉시 구매가 내용 입력
    ///   - type: 판매 or 구매
    /// - Returns: 커스텀한 버튼 반환
    private func makeBottomBtn(price: String, sub: String, type: PurchaseButtonType) -> PurchaseButton {
        let btn = PurchaseButton(frame: .zero, btnType: type)
        btn.priceLabel.text = price
        btn.subLabel.text = sub
        btn.isUserInteractionEnabled = true
        return btn
    }
    
    /// 중복되는 라벨 생성
    /// - Parameters:
    ///   - text: 텍스트 값
    ///   - font: 텍스트 폰트
    ///   - color: 텍스트 색상
    /// - Returns: UILabel 반환
    private func makeLabel(_ text: String, _ font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }
    
    /// 중복되는 스택 반환
    /// - Parameters:
    ///   - spacing: 스택 내부 간격 조정
    ///   - axis: 스택 축
    /// - Returns: UIStackView 반환
    private func makeStack(spacing: CGFloat, axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.spacing = spacing
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        return stack
    }
    
    // MARK: - Constaints & Add Function
    
    /// 스택뷰에 컴포넌트 추가
    private func addStackView() {
        [priceTitleLabel, priceLabel].forEach{ self.priceStack.addArrangedSubview($0) }
        [productName, productDescription].forEach{ self.productStack.addArrangedSubview($0) }
        [leftPurchaseBtn, rightSalesBtn].forEach{ self.bottomButtonStack.addArrangedSubview($0) }
    }
    
    /// 컴포넌트 추가 함수
    private func addComponents() {
        [productImageView, productCollectionView].forEach{ self.addSubview($0) }
        [priceStack, productStack, bottomBackgroundView].forEach{ self.addSubview($0) }
        [tagBtn, bottomButtonStack].forEach{ self.bottomBackgroundView.addSubview($0) }
    }
    
    /// 오토레이아웃 지정
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
