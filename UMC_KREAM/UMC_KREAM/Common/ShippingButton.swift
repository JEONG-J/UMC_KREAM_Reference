//
//  ShippingButton.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit

class ShippingButton: UIView, PurchaseButtonProtocol {
    
    let btnType: ShippingButtonType

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
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.white
        return label
    }()
    
    var subLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    var priceInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    private func setConfigure(type: ShippingButtonType) {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
        subLabel.textColor = setTextColor(type: type)
        subLabel.text = setSubText(type: type)
    }
    
    private func addStackView() {
        [priceLabel, subLabel].forEach{ self.priceInfoStack.addArrangedSubview($0) }
    }
    
    private func addComponents() {
        [priceInfoStack].forEach{ self.addSubview($0) }
    }
    
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
