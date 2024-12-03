//
//  BaseURLProtocol.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 12/2/24.
//

import Foundation
import Moya

protocol BaseURLProtocol: TargetType {}

extension BaseURLProtocol {
    var baseURL: URL {
        guard let url = URL(string: SecretClass.shared.baseURL()) else {
            fatalError("print: \(SecretClass.shared.baseURL())")
        }
        return url
    }
}
