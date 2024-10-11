//
//  MyPageManageViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit

/// 프로필 관리 페이지 뷰 컨트롤러
class MyPageManageViewController: UIViewController {
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = profileManagerView
        setNavigation()
    }
    
    // MARK: - Property
    
    /// 네비게이션 바의 상단 화면으로 나가는 버튼 + 네비게이션 타이틀 지정
    private func setNavigation() {
        self.navigationItem.title = "프로필 관리"
        
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), style: .plain, target: self, action: #selector(didTap))
        navigationItem.leftBarButtonItem = backBtn
    }
    
    /// 프로필 관리 페이지 커스텀 뷰
    private lazy var profileManagerView: ProfileManagerView = {
        let view = ProfileManagerView()
        view.idCheckBtn.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
        view.pwdCheckBtn.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
        return view
    }()
    
    // MARK: - Function
    
    /// 네비게이션 왼쪽 상단 버튼을 통해 이전 화면으로 돌아감
    @objc func didTap() {
        navigationController?.popViewController(animated: true)
    }
    
    /// 아이디 및 비밀번호 변경 버튼
    /// - Parameter sender: 현재 클릭된 UIButton
    @objc func clickedBtn(_ sender: UIButton) {
        let config = getButtonConfig(button: sender)
        guard let textField = config.textField, let userDefaultsKey = config.UserDefaultsKey else { return }
        
        if sender.titleLabel?.text == "변경" {
            sender.setTitle("확인", for: .normal)
            textField.isUserInteractionEnabled = true
            textField.becomeFirstResponder()
        } else if sender.titleLabel?.text == "확인" {
            if let text = textField.text, !text.isEmpty {
                saveUserDefaults(text, forKey: userDefaultsKey)
                sender.setTitle("변경", for: .normal)
                textField.isUserInteractionEnabled = false
                textField.resignFirstResponder()
            }
        }
    }
    
    /// 변경 버튼이 아이디에 해당하는지 비밀번호에 해당하는지 판단 함수
    /// - Parameter button: 현재 눌린 UIButton
    /// - Returns: 눌린 버튼에 해당하는 아이디 또는 비밀번호 텍스트 필드 + UserDefaults Key 값
    private func getButtonConfig(button: UIButton) -> (textField: UITextField?, UserDefaultsKey: String?) {
        if button == profileManagerView.idCheckBtn {
            return (profileManagerView.idTextField, "userId")
        } else if button == profileManagerView.pwdCheckBtn {
            return (profileManagerView.pwdTextField, "userPwd")
        }
        return (nil, nil)
    }
    
    /// 변경된 값 UserDefaults에 저장
    /// - Parameters:
    ///   - value: 새롭게 입력된 값
    ///   - key: UserDefaults 키
    private func saveUserDefaults(_ value: String, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
