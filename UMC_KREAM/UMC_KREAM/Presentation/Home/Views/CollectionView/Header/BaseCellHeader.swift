//
//  BaseCellHeader.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 11/13/24.
//

import UIKit
import SnapKit

/// 셀의 커스텀 헤더
class BaseCellHeader: UICollectionReusableView, CellHeaderProtocol {
    
    static let identifier: String = "BaseCellHeader"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Init
    
    /// 헤더의 메인 타이틀 라벨
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.black
        return label
    }()
    
    /// 헤더의 서브 타이틀 라벨
    lazy var headerSubTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    /// 헤더의 타이틀을 담는 스택
    private lazy var headerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .equalSpacing
        return stack
    }()
    
    /// 컴포넌트 추가 함수
    private func addComponents() {
        [headerTitle, headerSubTitle].forEach { self.headerStack.addArrangedSubview($0) }
        self.addSubview(headerStack)
    }
    
    /// 제약 조건 설정
    private func constraints() {
        
        headerStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.right.bottom.equalToSuperview()
        }
        
        headerTitle.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(200)
            $0.height.equalTo(19)
        }
        
        headerSubTitle.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(50)
            $0.height.equalTo(19)
        }
    }
    
    /// 섹션 마다 헤더의 값이 다르기 때문에 뷰 컨트롤러에서 헤더를 지정할 때 값을 넣어줄 수 있도록 한다.
    /// - Parameters:
    ///   - title: 헤더의 메인 타이틀 값
    ///   - subTitle: 헤더의 서브 타이틀 값
    public func configure(title: String, subTitle: String) {
        self.headerTitle.text = title
        self.headerSubTitle.text = subTitle
    }
}
