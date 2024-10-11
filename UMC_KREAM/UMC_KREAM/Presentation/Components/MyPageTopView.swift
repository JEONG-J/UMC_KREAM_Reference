//
//  MyPageTopView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.


import UIKit
import SnapKit

/// 마이페이지 뷰의 상단 뷰
class MyPageTopView: UIView {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addStackView()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    /// 상단 옵션 아이콘 버튼
    private lazy var optionIcon: UIButton = makeIconBtn(image: "option.pdf")
    
    /// 상단 카메라 아이콘 버튼
    private lazy var cameraIcon: UIButton = makeIconBtn(image: "camera.pdf")
    
    
    /// 유저 프로필 이미지 뷰
    private lazy var userProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile.pdf")
        return imageView
    }()
    
    /// 유저 이름 라벨
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "Jeong_iOS"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    /// 유저 팔로워 수 라벨
    private lazy var userFollow: UILabel = makeUserSub(content: "팔로워", count: 326)
    
    /// 유저 팔로잉 수 라벨
    private lazy var userFollowing: UILabel = makeUserSub(content: "팔로잉", count: 20)
    
    /// 프로필 관리 버튼
    public lazy var profileManageBtn: UIButton = makeUserBtn(title: "프로필 관리")
    
    /// 프로필 공유 버튼
    public lazy var profileShareBtn: UIButton = makeUserBtn(title: "프로필 공유")
    
    // MARK: - StackView
    
    /// 상단 카메라 버튼 + 옵션 버튼 모음 스택
    private lazy var topOptionStack: UIStackView = makeStackView(axis: .horizontal, spacing: 277)
    
    /// 유저 팔로워 수 + 팔로잉 수 라벨 모음 스택
    private lazy var userFollowerStack: UIStackView = makeStackView(axis: .horizontal, spacing: 8)
    
    /// 유저 이름 라벨 + userFollowerStack 모음 스택
    private lazy var userInfoTextStack: UIStackView = makeStackView(axis: .vertical, spacing: 6)
    
    /// 프로필 관리 버튼 + 프로필 공유 버튼 모음 스택
    private lazy var profileBtnStack: UIStackView = makeStackView(axis: .horizontal, spacing: 14)
    
    
    // MARK: - Make Function
    
    /// 상단 중복되는 아이콘 버튼 생성
    /// - Parameter image: 아이콘 이미지 String
    /// - Returns: 지정된 스타일의 UIButton 객체
    private func makeIconBtn(image: String) -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(named: image), for: .normal)
        return btn
    }
    
    /// 팔로워 및 팔로잉 생성 라벨
    /// - Parameters:
    ///   - content: 팔로워, 팔로잉 중 작성
    ///   - count: 팔로워, 팔로잉에 해당하는 숫자
    /// - Returns: 숫자와 한글 스타일 별도 지정된 UILabel 객체
    private func makeUserSub(content: String, count: Int) -> UILabel {
        let label = UILabel()
        
        let textValue = content + " " + String(count)
        let attributedString = NSMutableAttributedString(string: textValue)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .regular), range: NSRange(location: 0, length: content.count))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .bold), range: NSRange(location: content.count, length: String(count).count + 1))
        
        label.attributedText = attributedString
        label.textColor = UIColor.black
        return label
    }
    
    /// 프로필 관리 및 프로필 공유 중복되는 버튼 생성
    /// - Parameter title: 원하는 타이틀 생성
    /// - Returns: 지정된 스타일의 UIButton 객체
    private func makeUserBtn(title: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.gray.cgColor
        return btn
    }
    
    /// 중복되는 스택뷰 생성
    /// - Parameters:
    ///   - axis: 스택 뷰 축 지정 (수직, 수평)
    ///   - spacing: 스택 내부 간격 지정
    /// - Returns: 지정된 스타일의 UIStackView 객체
    private func makeStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    // MARK: - Constaints & Add Function
    
    /// 스택 븁 내뷰에 컴포넌트 생성 함수
    private func addStackView() {
        [optionIcon, cameraIcon].forEach{ topOptionStack.addArrangedSubview($0) }
        
        [userFollow, userFollowing].forEach{ userFollowerStack.addArrangedSubview($0) }
        [userName, userFollowerStack].forEach{ userInfoTextStack.addArrangedSubview($0) }
        
        [profileManageBtn, profileShareBtn].forEach{ profileBtnStack.addArrangedSubview($0) }
    }
    
    
    /// 컴포넌트 생성
    private func addComponents() {
        
        [topOptionStack, userProfile, userInfoTextStack, profileBtnStack].forEach { self.addSubview($0) }
    }
    
    
    /// 오토레이아웃 지정
    private func constraints() {
        
        topOptionStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.left.equalToSuperview().offset(32.5)
            $0.right.equalToSuperview().offset(-32.5)
            $0.height.equalTo(25)
        }
        
        userProfile.snp.makeConstraints {
            $0.top.equalTo(topOptionStack.snp.bottom).offset(26)
            $0.left.equalToSuperview().offset(32.5)
            $0.width.height.equalTo(90)
        }
        
        userInfoTextStack.snp.makeConstraints {
            $0.left.equalTo(userProfile.snp.right).offset(16)
            $0.top.equalTo(topOptionStack.snp.bottom).offset(47)
            $0.width.greaterThanOrEqualTo(115)
            $0.height.equalTo(48)
        }
        
        profileBtnStack.snp.makeConstraints {
            $0.left.equalToSuperview().offset(32.5)
            $0.right.equalToSuperview().offset(-32.5)
            $0.bottom.equalToSuperview().offset(-29)
            $0.height.equalTo(26)
        }
        
        profileManageBtn.snp.makeConstraints {
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
        
        profileShareBtn.snp.makeConstraints {
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
    }
}
