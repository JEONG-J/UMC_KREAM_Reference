//
//  ViewController.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 9/23/24.
//

import UIKit

/// 로그인 화면 뷰 컨트롤러
class LoginViewController: UIViewController {
    
    /// 아이디, 비번 지정 변수
    let userInfo: UserInfo = UserInfo(id: "JeOng", pwd: "1234")
    
    /// 앱 실행 단계
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    // MARK: - Property
    
    /// 커스텀으로 작성한 로그인 뷰
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginBtn.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
        view.kakaoBtn.addTarget(self, action: #selector(loginKakao), for: .touchUpInside)
        return view
    }()
    
    // MARK: - Function
    
    /// 데이터 모델에 지정한 아이디, 비밀번호에 해당 할 경우 로그인 가능하도록 하는 함수
    @objc private func loginFunction() {
        guard let inputId = loginView.idTextField.text,
              let inputPwd = loginView.pwdTextField.text,
              !inputId.isEmpty, !inputPwd.isEmpty else {
            print("아이디와 비밀번호를 입력해주세요")
            return
        }
        
        if let storedUserInfo = UserInfo.loadUserDefaults() {
            if storedUserInfo.id == inputId && storedUserInfo.pwd == inputPwd {
                print("기존 사용자 로그인 성공")
                changeRootView()
            } else {
                print("아이디 또는 비밀번호 불일치")
            }
        } else {
            let newUserInfo = UserInfo(id: inputId, pwd: inputPwd)
            newUserInfo.saveUserDefaults()
            print("아이디 비밀번호 새롭게 갱신 및 로그인 성공")
            changeRootView()
        }
    }
    
    /// 카카오톡 로그인 시도함과 동시에 accessToken과 Nickname을 키체인에 저장합나다. 또한 키체인 저장후 루트뷰를 전환하여 크림앱에 들어갈 수 있도록 합니다.
    @MainActor
    @objc private func loginKakao() {
        Task {
            do {
                let accessToken = try await KakaoLoginManager.shared.fetchAcessToken()
                let nickname = try await KakaoLoginManager.shared.fetchUserNickname(accessToken: accessToken)
                
                let keychainCheck = KeychainManager.standard.saveSession(UserKeychainInfo(accessToken: accessToken, nickname: nickname), for: "kreamKeychain")
                
                print("키체인 저장 확인 : \(keychainCheck)")
                
                changeRootView()
            }
        }
    }
    
    /// 로그인 뷰 -> TabBarController 루트 뷰 전환 함수
    private func changeRootView() {
        let rootVC = MainTabBarController()
        
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = window.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = rootVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}

