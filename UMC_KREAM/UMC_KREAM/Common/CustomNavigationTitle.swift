//
//  CustomNavigationTitle.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit
import SnapKit

class CustomNavigationTitle: UIView {
    
    let titleText: String
    let subTitleText: String?

    init(frame: CGRect, titleText: String, subTitleText: String?) {
        self.titleText = titleText
        self.subTitleText = subTitleText
        
        super.init(frame: frame)
        
        setTitle(title: titleText, subTitle: subTitleText)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    private lazy var titleStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .center
        return stack
    }()
    
    private func setTitle(title: String, subTitle: String?) {
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle ?? nil
    }
    
    private func constraints() {
        self.addSubview(titleStack)
        titleStack.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
    

}
