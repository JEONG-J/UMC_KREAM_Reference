//
//  ShippingButton.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit

/// 빠른 배송 또는 일반 배송 버튼을 초기화에 따른 커스텀 버튼 생성
/// 버튼 타입이 아닌, UIView 타입으로 하여 커스텀한 버튼 작성
/// /// UIView 상속을 받기 때문에 버튼의 Action 지정은 addTarget이 아닌, UITapGesture를 지정하여 Action이 일어나도록 해야함!!
class ShippingButton: UIView, PurchaseButtonProtocol {
    
    // MARK: - Init
    
    let btnType: ShippingButtonType

    /// 빠른 배송 또는 일반 배송 버튼의 초기화 부분
    /// - Parameters:
    ///   - frame: 버튼의 프레임
    ///   - btnType: 빠른 배송 타입 or 일반 배송 타입 선택
    ///
    /*
     init() 내부 코드 작성 순서는 아래와 같습니다. 아래 순서를 지키지 않으면 컴파일 초기화 오류가 생길 것입니다.
        1. init()을 override 하지 않기 때문에 초기화 값을 먼저 넣고,
        2. super init으로 프레임을 지정한다
        3. 초기화 값을 사용하여 버튼을 커스텀한다.
     */
    init(frame: CGRect, btnType: ShippingButtonType) {
        self.btnType = btnType
        super.init(frame: frame)
        
        setConfigure(type: btnType)
        setBackgroundColor(type: btnType)
        addStackView()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    /// 커스텀 버튼에서 사용할 가격 표시 라벨
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.white
        return label
    }()
    
    /// 커스텀 버튼에서 사용할 가격 밑에 보이는 텍스트, "빠른 배송", "일반 배송"
    var subLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    /// 버튼의 왼쪽에 구매 타입의 버튼인지, 판매 타입의 버튼인지 텍스트를 보일 라벨
    var priceInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Function
    
    /// 컴포넌트 스택에 추가
    private func addStackView() {
        [priceLabel, subLabel].forEach{ self.priceInfoStack.addArrangedSubview($0) }
    }
    
    /// 버튼 내부에 추가할 컴포넌트
    private func addComponents() {
        [priceInfoStack].forEach{ self.addSubview($0) }
    }
    
    /// 제약 조건 설정
    private func constraints() {
        priceInfoStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.width.greaterThanOrEqualTo(53)
            $0.height.equalTo(30)
        }
        
        priceLabel.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(30)
        }
        
        subLabel.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(30)
        }
    }

    // MARK: - SetupButton Custom
    
    /// 버튼 타입을 통해 버튼 내부 텍스트 커스텀 및 버튼 자체 커스텀
    /// - Parameter type: 빠른 배송 or 일반 배송
    private func setConfigure(type: ShippingButtonType) {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
        subLabel.textColor = setTextColor(type: type)
        subLabel.text = setSubText(type: type)
    }
    
    private func setTextColor(type: ShippingButtonType) -> UIColor {
        switch type {
        case .speed:
            return UIColor(red: 1, green: 0.792, blue: 0.725, alpha: 1)
        case .normal:
            return UIColor(red: 0.886, green: 0.886, blue: 0.886, alpha: 1)
        }
    }
    
    private func setBackgroundColor(type: ShippingButtonType) {
        switch type {
        case .speed:
            self.backgroundColor =  UIColor(red: 0.937, green: 0.384, blue: 0.329, alpha: 1)
        case .normal:
            self.backgroundColor =  UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1)
        }
    }
    
    private func setSubText(type: ShippingButtonType) -> String {
        switch type {
        case .speed:
            return "빠른배송(1~2일 소요)"
        case .normal:
            return "일반배송(5~7일 소요)"
        }
    }

}
