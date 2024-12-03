//
//  UserInfoResponse.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/29/24.
//

import Foundation

struct UserInfoResponse: Codable {
    let id: Int
    let properties: [String: String]?
}
