//
//  SizeUIButton.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit
import SnapKit

class PurchaseButton: UIView, PurchaseButtonProtocol {
    
    // MARK: - Init
    
    let btnType: PurchaseButtonType
    
    init(frame: CGRect, btnType: PurchaseButtonType) {
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
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor.white
        return label
    }()
    
    var subLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    var buttonLeftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    var priceInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        return stack
    }()
    
    // MARK: - Function
    
    private func setConfigure(type: PurchaseButtonType) {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
        buttonLeftLabel.text = buttonLeftText(type: type)
        subLabel.textColor = setTextColor(type: type)
    }
    
    private func addStackView() {
        [priceLabel, subLabel].forEach{ self.priceInfoStack.addArrangedSubview($0) }
    }
    
    private func addComponents() {
        [buttonLeftLabel, priceInfoStack].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        buttonLeftLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-15)
            $0.left.equalToSuperview().offset(10)
            $0.width.equalTo(28)
        }
        
        priceInfoStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(buttonLeftLabel.snp.right).offset(21)
            $0.width.greaterThanOrEqualTo(53)
            $0.height.equalTo(30)
        }
        
        priceLabel.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(30)
            $0.height.equalTo(16)
        }
        
        subLabel.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(30)
            $0.height.equalTo(12)
        }
    }
    
    private func setTextColor(type: PurchaseButtonType) -> UIColor {
        switch type {
        case .purchase:
            return UIColor(red: 0.639, green: 0.216, blue: 0.137, alpha: 1)
        case .sales:
            return UIColor(red: 0.122, green: 0.467, blue: 0.271, alpha: 1)
        }
    }
    
    private func setBackgroundColor(type: PurchaseButtonType) {
        switch type {
        case .purchase:
            self.backgroundColor = UIColor(red: 0.937, green: 0.384, blue: 0.329, alpha: 1)
        case .sales:
            self.backgroundColor = UIColor(red: 0.255, green: 0.725, blue: 0.478, alpha: 1)
        }
    }
    
    private func buttonLeftText(type: PurchaseButtonType) -> String {
        switch type {
        case .purchase:
            return "구매"
        case .sales:
            return "판매"
        }
    }
    
    // MARK: - Property
    
   
}
