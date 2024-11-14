//
//  SavedTableViewCell.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/11/24.
//

import UIKit
import SnapKit

/// Saved에 사용하는 테이블 뷰 셀
class SavedTableViewCell: UITableViewCell {
    
    static let identifier: String = "SavedCell"
    
    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        titleLabel.text = nil
        subTitleLabel.text = nil
        priceLabel.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addStackView()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    /// 셀에 들어가는 상품 이미지
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    /// 셀의 라벨을 담는 스택 뷰
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fill
        return stackView
    }()
    
    /// 셀에 들어가는 태그 이미지
    private lazy var tagImage: UIImageView = UIImageView.init(image: UIImage(named: "tag.pdf"))
    
    /// 셀에 들어가는 타이틀 라벨
    private lazy var titleLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .semibold), color: UIColor.black)
    
    /// 셀에 들어가는 서브 타이틀 라벨
    private lazy var subTitleLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 9, weight: .medium), color: UIColor.lightGray)
    
    private lazy var priceLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 14, weight: .semibold), color: UIColor.black)
    // MARK: - MakeFunction
    
    /// 셀에 들어가는 라벨 재사용
    /// - Parameters:
    ///   - font: 텍스트 폰트 지정
    ///   - color: 텍스트 칼라 지정
    /// - Returns: 지정된 스타일의 UILabel 객체
    private func makeLabel(font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        label.numberOfLines = 2
        return label
    }
    
    // MARK: - Constraints & Add Function
    /// 라벨 타이틀에 추가
    private func addStackView() {
        [titleLabel, subTitleLabel].forEach{ labelStackView.addArrangedSubview($0) }
    }
    
    /// 캄퍼넌트 추가
    private func addComponents() {
        [productImageView, labelStackView, tagImage, priceLabel].forEach{ self.addSubview($0) }
    }
    
    /// 오토레이아웃 설정
    private func constraints() {
        productImageView.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(13)
            $0.height.width.equalTo(72)
        }
        
        labelStackView.snp.makeConstraints {
            $0.left.equalTo(productImageView.snp.right).offset(13)
            $0.top.equalToSuperview().offset(13)
            $0.width.equalTo(153)
            $0.height.equalTo(54)
        }
        
        tagImage.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-17)
            $0.top.equalToSuperview().offset(18)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
        
        priceLabel.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(67)
            $0.width.lessThanOrEqualTo(120)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.height.equalTo(33)
        }
    }
    
    /// Cell 내부 속성 조정 함수, 뷰 컨트롤러 접근
    /// - Parameter model: Cell에 사용하는 더미 데이터 모델
    public func configure(model: SavedProduct) {
        self.productImageView.image = UIImage(named: model.imageName)
        self.titleLabel.text = model.description.title
        self.subTitleLabel.text = model.description.subTitle
        self.priceLabel.text = "\(formatPrice(model.price))원"
    }
    
    /// 가격을 3자리마다 쉼표를 찍는 형식으로 변환
    /// - Parameter price: 변환할 가격 (Int)
    /// - Returns: 3자리마다 쉼표가 찍힌 문자열
    private func formatPrice(_ price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
}
