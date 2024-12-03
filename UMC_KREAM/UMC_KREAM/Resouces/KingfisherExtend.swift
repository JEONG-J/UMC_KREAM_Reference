//
//  KingfisherExtend.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹  on 12/3/24.
//

import UIKit
import Kingfisher

// UIImageView의 Kingfisher 처리를 위한 Extend
extension UIImageView {
    /// 이미지 주소 값을 넣으면 이미지를 가져와서 지정된 이미지뷰의 이미지로 활용
    /// - Parameters:
    ///   - urlString: 이미지 URL 주소
    ///   - placeholder: 이미지 로딩 되는 동안 보이는 ProgressView처리(지금은 그냥 대충 넣어두었습니다)
    func setImage(from urlString: String?, placeholder: String = "placeholder") {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = UIImage(named: placeholder)
            return
        }
        self.kf.setImage(with: url, placeholder: UIImage(named: placeholder))
    }
}
