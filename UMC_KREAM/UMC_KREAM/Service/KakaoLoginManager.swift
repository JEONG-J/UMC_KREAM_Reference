//
//  KakaoLoginManager.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 11/29/24.
//

import Foundation
import Alamofire
import KakaoSDKAuth
import KakaoSDKUser

/// 카카오톡 로그인을 담당하는 Manager 설정
/// 기본적으로 카카오 로그인은 Main Actor에서만 실행되기 떄문에 MainActor 지정
@MainActor
class KakaoLoginManager {
    static let shared = KakaoLoginManager()
    
    /// 카카오로부터 로그인한 사용자의 액세스 토큰을 받아와서 반환한다. AccessToken 활용은 워크북에서 말했듯이, Alamofire를 통해 유저 이름 받아오는데 사용될 것이다.
    /// - Returns: 앱으로 로그인 하던, 웹으로 로그인하던 AccessToken 반환
    func fetchAcessToken() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            if UserApi.isKakaoTalkLoginAvailable() {
                UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let oauthToken = oauthToken {
                        continuation.resume(returning: oauthToken.accessToken)
                    }
                }
            } else {
                UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let oauthToken = oauthToken {
                        continuation.resume(returning: oauthToken.accessToken)
                    }
                }
            }
        }
    }
    
    /// AccessToken을 사용하여 해당 토큰의 사용자 이름을 받아온다.
    /// - Parameter accessToken: 카카오 로그인을 통해 받아온 AccessToken
    /// - Returns: 액세스 토큰에 해당하는 유저 이름, 이 이름은 마이페이지에 본인 이름으로 사용될 것이다.
    func fetchUserNickname(accessToken: String) async throws -> String {
        let url = "https://kapi.kakao.com/v2/user/me"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)"
        ]
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get, headers: headers).responseDecodable(of: UserInfoResponse.self) { response in
                switch response.result {
                case .success(let userInfo):
                    if let nickname = userInfo.properties?["nickname"] {
                        continuation.resume(returning: nickname)
                    } else  {
                        continuation.resume(throwing: KakaoLoginError.nickNameNotFound)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
}
