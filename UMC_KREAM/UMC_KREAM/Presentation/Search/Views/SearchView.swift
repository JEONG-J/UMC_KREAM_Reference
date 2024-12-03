//
//  HomeSearchView.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 11/29/24.
//

import UIKit
import SnapKit

/// 최근 검색 단어를 보이는 뷰
class SearchView: UIView {
    
    /// 해당 메서드를 통해 최큰 검색 버튼을 눌렀을 때 처리되는 함수 만들 수 있음
    var onSearchButtonClicked: ((String) -> Void)?
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        changeCancelKorean()
        addComponents()
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 검색바
    public lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.showsCancelButton = true
        return searchBar
    }()
    
    /// 기본적으로 검색바를 만들면 취소 버튼이 아닌, cancel이라고 영어로 칭해져서 등장한다. 이를 취소 버튼으로 재생성
    private func changeCancelKorean() {
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.setTitle("취소", for: .normal)
        }
    }
    
    /// 검색 필터 밑의 추천 검색어 라벨
    private lazy var recentSearchLabel: UILabel = {
        let label = UILabel()
        label.text = "추천 검색어"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    /// 최근 검색어들을 담기위한 스택
    /* 실제 프로젝트를 진행 시 CollectionView로 만들어주세요!! 원래 CollectionView로 만들어서 관리하는 겁니다. */
    /* 간단하게 피그마처럼된다는 걸 보이기 위해 StackView로 만들어서 구성했습니다. */
    private lazy var recentSearchStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    /// 스택뷰에 한 행에 대한 스택뷰를 넣어서 최근 검색어를 관리할 수 있돌록 합니다. 한줄에 최개 5개의 최근 검색어를 넣을 수 있도록 합니다.
    /// - Parameter searches: 최근 검색 단어들 배열값
    public func updateRecentSearchButton(_ searches: [String]) {
        recentSearchStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let maxButtonsPerRow = 5
        var currentRowStack: UIStackView?
        
        for (index, keyword) in searches.enumerated() {
            if index % maxButtonsPerRow == 0 {
                currentRowStack = UIStackView()
                currentRowStack?.axis = .horizontal
                currentRowStack?.spacing = 3
                currentRowStack?.alignment = .center
                currentRowStack?.distribution = .fillEqually
                if let rowStack = currentRowStack {
                    recentSearchStack.addArrangedSubview(rowStack)
                }
            }
            
            let button = UIButton()
            
            var configuration = UIButton.Configuration.plain()
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 11, bottom: 8, trailing: 11)
            button.configuration = configuration
            
            button.setTitle(keyword, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
            button.setTitleColor(UIColor.black, for: .normal)
            
            button.backgroundColor = .systemGray5
            
            button.addAction(UIAction { [weak self] _ in
                self?.onSearchButtonClicked?(keyword)
            }, for: .touchUpInside)
            
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 20
            
            currentRowStack?.addArrangedSubview(button)
        }
    }
    
    
    private func addComponents() {
        [recentSearchLabel, recentSearchStack].forEach { self.addSubview($0) }
    }
    
    private func constraints() {
        recentSearchLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(69)
            $0.height.equalTo(18)
        }
        
        recentSearchStack.snp.makeConstraints {
            $0.top.equalTo(recentSearchLabel.snp.bottom).offset(15)
            $0.left.equalToSuperview().offset(16)
            $0.width.greaterThanOrEqualTo(100)
            $0.height.greaterThanOrEqualTo(20)
        }
    }
    
}
