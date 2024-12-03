//
//  Keychain.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 12/3/24.
//

import Foundation
import Security

class KeychainManager: @unchecked Sendable {
    
    static let standard = KeychainManager()
    
    // MARK: - KeyChainManagerFunction
    
    /// 토큰 키 체인 등록
    /// - Parameters:
    ///   - data: 전달 받은 토큰값 입력
    ///   - key: 토큰 값에 쌍으로 매칭될 키값
    /// - Returns: 저장 되었는지 참거짓으로 반환
    private func save(_ data: Data, for key: String) -> Bool {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data,
            kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked
        ]
        
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil) == noErr
    }
    
    /// 저장된 토큰값 불러온다.
    /// - Parameter key: 토큰 값에 연결될 키값
    /// - Returns: 저장된 값에 대해 Data 타입을 불러온다.
    private func load(key: String) -> Data? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var item: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == noErr, let data = item as? Data else {
            return nil
        }
        return data
    }
    
    /// 저장된 회원정보 삭제
    /// - Parameter key: 지우고자 하는 토큰의 키값 삭제
    private func delete(key: String) {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        
        SecItemDelete(query as CFDictionary)
    }
    
    // MARK: - Session
    
    
    /// 세션에 저장된 정보를 저장한다.
    /// - Parameters:
    ///   - session: 유저 정보를 담고 있는 데이터
    ///   - key: 저장할 키 입력
    /// - Returns: 저장완료 참 거짓
    public func saveSession(_ session: UserKeychainInfo, for key: String) -> Bool {
        guard let data = try? JSONEncoder().encode(session) else { return false }
        return save(data, for: key)
    }
    
    /// 세션에 저장된 정보 가져온다.
    /// - Parameter key: 저장된 유저 정보 부르고자 하는 키값
    /// - Returns: 키값으로 저장된 유저 정보 저장
    public func loadSession(for key: String) -> UserKeychainInfo? {
        guard let data = load(key: key),
              let session = try? JSONDecoder().decode(UserKeychainInfo.self, from: data) else { return nil }
        return session
    }
    
    /// 유저 정보 삭제
    /// - Parameter key: 삭제하고자 하는 유저
    public func deleteSession(for key: String) {
        delete(key: key)
    }
}
