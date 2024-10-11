//
//  SavedView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/12/24.
//

import UIKit
import SnapKit


class SavedView: UIView {
    
    let productCount: Int

    // MARK: - Init
    init(frame: CGRect = .zero, productCount: Int) {
        self.productCount = productCount
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    /// 테이블 뷰 상단 타이틀
    private lazy var topTitle: UILabel = makeLabel("Saved", font: UIFont.systemFont(ofSize: 28, weight: .semibold))
    
    /// 테이블 뷰 셀 갯수 표시
    private lazy var countLabel: UILabel = makeLabel("전체 \(productCount)개", font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    /// 테이블 뷰
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    
    // MARK: - Function
    /// 공통 특성의 라벨 생성하기
    /// - Parameters:
    ///   - text: 원하는 텍스트 값 입력
    ///   - font: 폰트 지정
    /// - Returns: 지정된 스타일의 Label 생성
    private func makeLabel(_ text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.font = font
        label.text = text
        label.textColor = UIColor.black
        return label
    }
    
    /// 컴포넌트 추가 함수
    private func addComponents() {
        [topTitle, countLabel, tableView].forEach{ self.addSubview($0)}
    }
    
    /// 오토레이아웃 지정
    private func constraints() {
        topTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.left.equalToSuperview().offset(10)
            $0.width.equalTo(81)
            $0.height.equalTo(45)
        }
        
        countLabel.snp.makeConstraints {
            $0.top.equalTo(topTitle.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(10)
            $0.width.greaterThanOrEqualTo(55)
            $0.height.equalTo(22)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(12)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    
    
}
