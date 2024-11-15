//
//  CustomNavigationTitle.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit
import SnapKit

/// 상단의 커스텀 네비게이션 타이틀을 위한 뷰
/// 사이즈 선택 탭의 상단 타이틀 유형을 위함, 아래 그림과 같이 네비게이션 타이틀뷰를 생성함
/*
------------------------------------------
 
                title
               subTitle
 
 -----------------------------------------
 */
class CustomNavigationTitle: UIView {
    
    let titleText: String
    let subTitleText: String?

    
    // MARK: - Init
    
    /// 초기화 부분
    /// - Parameters:
    ///   - frame: 뷰 컨트롤러의 네비게이션 타이틀 위치의 프레임 유지
    ///   - titleText: 뷰 컨트롤러에서 사용할 네비게이션 메인 타이틀 값
    ///   - subTitleText: 뷰 컨트롤러에서 사용할 네비게이션 서브 타이틀 값
    /*
     init() 내부 코드 작성 순서는 아래와 같습니다. 아래 순서를 지키지 않으면 컴파일 초기화 오류가 생길 것입니다.
        1. init()을 override 하지 않기 때문에 초기화 값을 먼저 넣고,
        2. super init으로 프레임을 지정한다
        3. 초기화 값을 사용하여 버튼을 커스텀한다.
     */
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
    
    // MARK: - Property
    
    /// 네비게이션 타이틀뷰의 메인 타이틀 라벨
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    /// 네비게이션 타이틀뷰의 서브 타이틀 라벨
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    /// 네비게이션 타이틀뷰의 메인 타이틀 + 서브 타이틀 스택
    private lazy var titleStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Function
    
    /// 초기화를 통해 전달 받은 메인 타이틀 값, 서브 타이틀 값을 전달하여 해당 라벨에 적용
    /// - Parameters:
    ///   - title: 초기화를 통해 설정된 메인 타이틀 값
    ///   - subTitle: 초기화를 통해 설정된 서브 타이틀 값
    private func setTitle(title: String, subTitle: String?) {
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle ?? nil
    }
    
    /// 제약 조건 설정
    private func constraints() {
        self.addSubview(titleStack)
        titleStack.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
    

}
