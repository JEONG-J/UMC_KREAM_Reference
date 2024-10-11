//
//  ProfileManagerView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit

class ProfileManagerView: UIView {

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
        addStackView()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    /// 프로필 이미지 뷰
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile.pdf")
        return imageView
    }()
    
    /// 타이틀 지정
    private lazy var title: UILabel = makeTitleLabel("프로필 정보", font: UIFont.systemFont(ofSize: 14, weight: .bold))
    
    /// 아이디 입력 타이틀 라벨
    public lazy var idTitle: UILabel = makeTitleLabel("유저 이메일", font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    /// 비밀번호 입력 타이틀 라벨
    private lazy var pwdTitle: UILabel = makeTitleLabel("유저 비밀번호", font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    /// 아이디 입력 텍스트 필드
    public lazy var idTextField: UITextField = makeTextField("새로운 이메일을 입력해주세요!", defaultValueKey: "userId")
    
    /// 비밀번호 입력 텍스트 필드
    public lazy var pwdTextField: UITextField = makeTextField("새로운 비밀번호를 입력해주세요!", defaultValueKey: "userPwd")
    
    /// 아이디 체크 버튼
    public lazy var idCheckBtn: UIButton = makeCheckBtn(title: "변경")
    
    /// 비밀번호 체크 버튼
    public lazy var pwdCheckBtn: UIButton = makeCheckBtn(title: "변경")
    
    // MARK: - Option
    
    /// placholder 커스텀 스타일 지정
    private lazy var placeholderAttributes: [NSAttributedString.Key: Any] = {
        var value = [NSAttributedString.Key: Any]()
        value[.foregroundColor] = UIColor.gray
        value[.font] = UIFont.systemFont(ofSize: 12)
        return value
    }()
    
    // MARK: - StackView
    
    /// 아이디 텍스트필드 + 아이디 체크 버튼 모음 스택
    private lazy var idCheckStack: UIStackView = makeStackView(axis: .horizontal, spacing: 9)
    
    /// 비밀번호 텍스트필드 + 비밀번호 체크 버튼 모음 스택
    private lazy var pwdCheckStack: UIStackView = makeStackView(axis: .horizontal, spacing: 9)
    
    /// 아이디 입력 타이틀 라벨 + idCheckStack 모음 스택
    private lazy var userIdStack: UIStackView = makeStackView(axis: .vertical, spacing: 4)
    
    
    /// 비밀번호 입력 타이틀 라벨 + pwdCheckStack 모음 스택
    private lazy var userPwdStack: UIStackView = makeStackView(axis: .vertical, spacing: 4)
    
    /// userIdStack + userPwdStack 모음 스택
    private lazy var userInputStack: UIStackView = makeStackView(axis: .vertical, spacing: 23)
    
    
    // MARK: - MakeFunction
    
    /// 타이틀 생성
    /// - Parameters:
    ///   - text: 타이틀 값으로 지정할 텍스트 값
    ///   - font: 타이틀 폰트 지정
    /// - Returns: 지정된 스타일의 UILabel 객체
    private func makeTitleLabel(_ text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = font
        return label
    }
    
    /// 텍스트 필드 생성
    /// - Parameter placeholder: 텍스트 필드 내부 placehodle 값 지정
    /// - Returns: 지정된 스타일의 UITextField 객체
    private func makeTextField(_ placeholder: String, defaultValueKey: String) -> UITextField {
        let textField = UITextField()
        let defaultValue = UserDefaults.standard.string(forKey: defaultValueKey)
        
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        textField.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 1))
        textField.leftViewMode = .always
        textField.textColor = UIColor.black
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        
        textField.text = defaultValue
        textField.isUserInteractionEnabled = false
        return textField
    }
    
    /// 중복되는 스택뷰 생성
    /// - Parameters:
    ///   - axis: 스택 축 조정
    ///   - spacing: 스택 내부 간경 조정
    /// - Returns: 지정된 스타일의 UIStackView 객체
    private func makeStackView(axis: NSLayoutConstraint.Axis ,spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        return stackView
    }
    
    /// 변경 및 확인 버튼
    /// - Parameter title: 버튼 내부 타이틀 지정
    /// - Returns: 지정된 스타일의 UIButton 객체
    private func makeCheckBtn(title: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle("변경", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        btn.setTitleColor(UIColor.black, for: .normal)
        
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1
        return btn
    }
    
    // MARK: - Constaints & Add Function
    
    /// 스택 뷰 내부 컴포넌트 생성
    private func addStackView() {
        [idTextField, idCheckBtn].forEach{ idCheckStack.addArrangedSubview($0) }
        [idTitle, idCheckStack].forEach{ userIdStack.addArrangedSubview($0) }
        [pwdTextField, pwdCheckBtn].forEach{ pwdCheckStack.addArrangedSubview($0) }
        [pwdTitle, pwdCheckStack].forEach{ userPwdStack.addArrangedSubview($0) }
        [title, userIdStack, userPwdStack].forEach{ userInputStack.addArrangedSubview($0) }
    }
    
    /// 컴포넌트 생성
    private func addComponents() {
        [profileImage, title, userInputStack].forEach{ self.addSubview($0) }
    }
    
    /// 오토레이아웃 지정
    private func constraints() {
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(144)
            $0.left.equalToSuperview().offset(151)
            $0.width.height.equalTo(90)
        }
        
        userInputStack.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(27)
            $0.right.equalToSuperview().offset(-17)
            $0.height.equalTo(191)
        }
        
        
        idTextField.snp.makeConstraints {
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        pwdTextField.snp.makeConstraints {
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        idCheckBtn.snp.makeConstraints {
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
        pwdCheckBtn.snp.makeConstraints {
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
    }

}
