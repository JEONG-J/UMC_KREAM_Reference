//
//  SearchManager.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 12/2/24.
//

import Foundation
import Moya

/// 검색 화면에서 실시간 검색 및 검색 결과 데이터 조회를 위한 SearchManager 설정
class SearchManager {
    private let provider = MoyaProvider<SearchRouter>()
    
    /// 검색 텍스트 필드에 넣은 값 API로 결과 받아오기
    /// - Parameters:
    ///   - query: 검색 하고자 하는 값, 텍스트 필드에 넣은 값을 쿼리로 사용
    ///   - completion: 성공과 실패에 따른 값 반환
    func fetchSearchResults(query: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        provider.request(.search(query: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: response.data)
                    completion(.success(searchResponse))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
