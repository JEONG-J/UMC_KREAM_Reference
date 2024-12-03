//
//  KakaoLoginError.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 11/29/24.
//

import Foundation

enum KakaoLoginError: Error, LocalizedError {
    case loginFailed
    case nickNameNotFound
    
    var errorDescription: String? {
        switch self {
        case .loginFailed:
            return "카카오 로그인 실패"
        case .nickNameNotFound:
            return "사용자 닉네임 찾을 수 없음"
        }
    }
}
