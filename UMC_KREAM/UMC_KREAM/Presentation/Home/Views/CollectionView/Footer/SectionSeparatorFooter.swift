//
//  SectionSeparatorFooter.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit
import SnapKit

class SectionSeparatorFooter: UICollectionReusableView {
    
    static let identifier: String = "SectionSeparatorFooter"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(separator)
        separator.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        return view
    }()
    
}
