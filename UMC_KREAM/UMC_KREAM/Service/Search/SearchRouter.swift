//
//  SearchRouter.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 12/2/24.
//

import Foundation
import Moya

/// 검색 라우터 설정, 기본적으로 워크북에서 하나의 api만을 사용하기 때문에 case는 하나만 존재
/*
 BaseURLProtocol은 BaseURL 값을 공통으로 사용하기 위해 추상화로 값 생성,
 실제 프로젝트 할 시 모든 라우터의 경우에 BaseURL은 공통으로 사용되기 때문에 미리 만들어 두는 것이 좋음!

 */
enum SearchRouter {
    case search(query: String)
}

extension SearchRouter: BaseURLProtocol {
    var path: String {
        switch self {
        case .search:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .search(let query):
            return .requestParameters(parameters: ["q": query], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let headers = ["Content-Type": "application/json"]
        
        return headers
    }
}
