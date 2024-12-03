//
//  UISearchResultView.swift
//  UMC_KREAM
//
//  Created by 7기 중앙 iOS 파트장 정의찬/제옹 on 12/2/24.
//

import UIKit
import SnapKit

/// 검색 결과 화면
class SearchResultView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        self.constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 검색 결과 데이터를 스택뷰에 넣어서 보이도록 함
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    /// 검색 결과 데이터가 수많가지 나올 수 있기 때문에 스크롤뷰로 감싸서 스크롤해서 볼 수 있도록 한다
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        return scrollView
    }()
    
    /// 검색 결과로 받아온 데이터를 반복문으로 돌면서 스택뷰에 추가한다.
    /// - Parameter results: 검색 결과 데이터 배열 값
    func updateResult(_ results: [String]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for result in results {
            let label = createResultLabel(result)
            stackView.addArrangedSubview(label)
        }
    }
    
    /// 검색 결과로 받아온 데이터의 값을 사용하는 Label을 생서해서 스택뷰에 추가한다
    /// - Parameter text: 검색 결과로 받아온 값
    /// - Returns: 검색 결과를 갖는 라벨
    private func createResultLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        return label
    }
    
    private func constraints() {
        scrollView.snp.makeConstraints {
            $0.top.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.left.right.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview() // 스크롤뷰의 위, 아래에 맞게 확장
            $0.leading.trailing.equalToSuperview() // 좌우 여백 없음
            $0.width.equalToSuperview() // 스크롤뷰의 폭에 맞춤
        }
    }
}
