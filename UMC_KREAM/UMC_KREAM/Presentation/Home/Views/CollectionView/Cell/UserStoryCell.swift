//
//  UserStoryCell.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 11/12/24.
//

import UIKit
import SnapKit

class UserStoryCell: BaseCollectionCell {
    
    static let identifier: String = "UserStoryCell"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageViewCorner(cornerRadius: 10)
        chageLabelColor()
        addComponents()
        constraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Function
    
    /// 사용자 계정 하얀색으로 변경하는 함수
    private func chageLabelColor() {
        self.subTitleText.textColor = UIColor.white
    }
    
    /* subTitleText로 선택한 이유는 유저의 계정을 표시하는 라벨의 폰트와 같기 때문!! */
    private func addComponents() {
        [self.imageView, self.subTitleText].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        subTitleText.snp.makeConstraints {
            $0.left.equalToSuperview().offset(11)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.greaterThanOrEqualTo(60)
            $0.height.equalTo(14)
        }
    }
    
    /// RequiredCellProtocol 상속을 받는 모델 값을 파라미터로 전달하여 해당 셀의 값 넣어준다.
    /// - Parameter model: RequiredCellProtocol을 상속받는 모델
    override func configure(model: any RequiredCellProtocol) {
        guard let userStroyModel = model as? UserStoryModel else { return }
        
        self.imageView.image = UIImage(named: userStroyModel.imageView)
        self.subTitleText.text = userStroyModel.userName
    }
}
