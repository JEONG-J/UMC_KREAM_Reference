//
//  PurchaseBottomBackground.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit
import SnapKit

/// 구매 뷰 또는 사이즈 선택 뷰에서 하단에 위치하는 백그라운드 뷰
class PurchaseBottomBackground: UIView {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.addSubview(topLine)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    /// 상단 구분선, 피그마를 통해 확대해서 보면 상단 선이 있음을 확인 가능
    /// 피그마의 라인 색을 적용 안하고 연한색 값을 그냥 넣어서 작성함
    private lazy var topLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    // MARK: - Function
    
    /// 제약 조건 설정
    private func constraints() {
        topLine.snp.makeConstraints {
            $0.top.left.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
