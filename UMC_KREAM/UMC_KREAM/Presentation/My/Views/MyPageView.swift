//
//  MyPageView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit
import SnapKit

class MyPageView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    /// 마이페이지 내부 상단 뷰
    public lazy var topView: MyPageTopView = {
        let view = MyPageTopView()
        view.backgroundColor = .white
        return view
    }()
    
    /// 마이페이지 하단 뷰
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - Constaints & Add Function
    
    /// 뷰 내부에 컴포넌트 생성 함수
    private func addComponents() {
        [topView, bottomView].forEach{ self.addSubview($0) }
    }
    
    /// 오토레이아웃 지정
    private func constraints() {
        topView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(bottomView.snp.top).offset(-24)
        }
        
        bottomView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(531)
        }
    }
    
}
