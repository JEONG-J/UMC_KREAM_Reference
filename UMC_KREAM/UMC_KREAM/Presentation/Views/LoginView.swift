//
//  LoginView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit
import SnapKit

/// 로그인 뷰에 사용되는 UIView
class LoginView: UIView {

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addStackView()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    /// 아이디 입력 타이틀 라벨
    private lazy var idTitleLabel = makeTitleTextLabel("이메일 주소")
    
    /// 아이디 입력 텍스트 필드
    public lazy var idTextField = makeTextField("예) kream@kream.co.kr")
    
    /// 비밀번호 입력 타이틀 라벨
    private lazy var pwdTitleLabel = makeTitleTextLabel("비밀번호")
    
    /// 비밀번호 입력 텍스트 필드
    public lazy var pwdTextField = makeTextField("비밀번호를 입력해주세요")
    
    /// 비밀번호 화면 로고 이미지뷰
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo.pdf")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    /// 로그인 버튼(아이디 및 비밀번호 입력 할 경우)
    public lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    /// 카카오 로그인 버튼
    private lazy var kakaoBtn: UIButton = makeSocialBtn(image: "kakao.pdf", title: "카카오로 로그인")
    
    /// 애플 로그인 버튼
    private lazy var appleBtn: UIButton = makeSocialBtn(image: "apple.pdf", title: "Apple로 로그인")
    
    // MARK: - StackView
    
    /// 아아디 타이틀 + 아이디 텍스트 필드 저장 스택
    private lazy var idStackView: UIStackView = makeStackView(spacing: 8)
    
    /// 비밀번호 타이틀 + 비밀번호 텍스트 필드 저장 스택
    private lazy var pwdStackView: UIStackView = makeStackView(spacing: 8)
    
    /// idStackView + pwdStackView + 로그인 버튼 모음 스택
    private lazy var topUserLoginStackView: UIStackView = makeStackView(spacing: 17)
    
    /// 하단 카카오 로그인 버튼 + 애플 로그인 버튼
    private lazy var bottomSocialStackView: UIStackView = makeStackView(spacing: 22)
    
    // MARK: - Option
    
    /// 버튼 타이틀 텍스트 스타일 지정
    private lazy var attributeContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        container.foregroundColor = UIColor.black
        return container
    }()
    
    /// TextField placeholder 커스텀 스타일 지정
    private lazy var placeholderContainer: [NSAttributedString.Key: Any] = {
        var value = [NSAttributedString.Key: Any]()
        value[.foregroundColor] = UIColor.gray
        value[.font] = UIFont.systemFont(ofSize: 12)
        return value
    }()
    
    
    // MARK: - MakeFunction
    
    /// 아이디 및 비밀번호 중복되는 타이틀 UILabel 생성
    /// - Parameter text: 타이틀로 사용할 텍스트
    /// - Returns: 설정된 스타일의 UILabel 객체
    private func makeTitleTextLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.black
        label.text = text
        return label
    }
    
    /// 아이디 및 비밀번호 입력 텍스트 입력 UITextField 생성
    /// - Parameter placeholder: 텍스트 필드 내부에 사용할 placeholder 지정
    /// - Returns: 설정된 스타일의 UITextField 객체
    private func makeTextField(_ placeholder: String) -> UITextField {
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderContainer)
        field.textColor = UIColor.black
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        field.leftViewMode = .always
        field.layer.borderColor =  UIColor(red: 0.635, green: 0.635, blue: 0.635, alpha: 1).cgColor
        field.clipsToBounds = true
        field.layer.cornerRadius = 15
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.gray.cgColor
        return field
    }
    
    /// 중복 되는 소셜 버튼 UIButton 샐서
    /// - Parameters: 버튼 속 사용하게 되는 소셜 로고 이미지 + 버튼 타이틀
    ///   - image: 로고 이미지 이름 String 값
    ///   - title: 버튼 타이틀 String 값
    /// - Returns: 설정된 스타일의 UIButton 객체
    private func makeSocialBtn(image: String, title: String) -> UIButton {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(named: image)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        
        configuration.attributedTitle = AttributedString(title, attributes: attributeContainer)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 17, bottom: 13, trailing: 102)
        btn.configuration = configuration
        
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.layer.borderWidth = 1
        
        return btn
    }
    
    /// 중복되는 스택뷰 생성
    /// - Parameter spacing: 스택 내부 간격 조정
    /// - Returns: Vertical 스택 뷰 반환
    private func makeStackView(spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = spacing
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    // MARK: - Constaints & Add Function
    
    /// 스택 뷰 내부에 컴포넌트 생성 함수
    private func addStackView() {
        [idTitleLabel, idTextField].forEach{ idStackView.addArrangedSubview($0) }
        [pwdTitleLabel, pwdTextField].forEach{ pwdStackView.addArrangedSubview($0) }
        [idStackView, pwdStackView, loginBtn].forEach{ topUserLoginStackView.addArrangedSubview($0) }
        [kakaoBtn, appleBtn].forEach{ bottomSocialStackView.addArrangedSubview($0) }
    }
    
    /// 컴포넌트 생성
    private func addComponents() {
        [logoImageView, topUserLoginStackView, bottomSocialStackView].forEach{ self.addSubview($0)}
    }
    
    /// 오토레이아웃 지정
    private func constraints() {
        
        idTextField.snp.makeConstraints {
            $0.height.equalTo(34)
        }
        
        pwdTextField.snp.makeConstraints {
            $0.height.equalTo(34)
        }
        
        loginBtn.snp.makeConstraints {
            $0.height.equalTo(38)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(126)
            $0.left.equalToSuperview().offset(53)
            $0.right.equalToSuperview().offset(-53)
        }
        
        topUserLoginStackView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(87)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().offset(-45)
        }
        
        bottomSocialStackView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(47.5)
            $0.right.equalToSuperview().offset(-47.5)
            $0.bottom.equalToSuperview().offset(-189)
        }
    }
}
