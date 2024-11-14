//
//  SizeCell.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit
import SnapKit

class SizeCell: UICollectionViewCell {
    
    static let identifier: String = "SizeCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        selfSetup()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var sizeLabel: UILabel = makeLabel(UIFont.systemFont(ofSize: 14, weight: .regular), color: .black)
    public lazy var priceLabel: UILabel = makeLabel(UIFont.systemFont(ofSize: 12, weight: .regular), color: .red)

    private func makeLabel(_ font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        return label
    }
    
    private func selfSetup() {
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
    
    private func addComponents() {
        [sizeLabel, priceLabel].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        sizeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.width.greaterThanOrEqualTo(9)
            $0.height.equalTo(17)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(sizeLabel.snp.bottom).offset(1)
            $0.centerX.equalTo(sizeLabel.snp.centerX)
            $0.width.greaterThanOrEqualTo(9)
            $0.height.equalTo(17)
        }
    }
    
    public func configure(model: SizeModel) {
        self.sizeLabel.text = model.size
        self.priceLabel.text = model.price
    }
    
    public func changeOption(isSelected: Bool) {
        if isSelected {
            self.priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            self.sizeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            self.layer.borderColor = UIColor.black.cgColor
        } else {
            self.priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            self.sizeLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            self.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
}
