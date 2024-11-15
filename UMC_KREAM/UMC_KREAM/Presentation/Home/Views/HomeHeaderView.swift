//
//  HomeTitleView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/12/24.
//

import UIKit
import SnapKit

/// 홈 뷰의 최상단 네비게이션 컨트롤 커스텀으로 지정
/*
 홈탭의 최상단 네비게이션에는 3가지의 컴포넌트가 존재합니다.
 1. 검색바
 2. 세그먼트 버튼
 3. 알림 벨 아이콘 버튼
 
 홈 뷰 컨트롤러의 네비게이션 값을 조정하여 검색바를 넣을 수 있고, 세그먼트 버튼도 넣을 수 있고, 벨 아이코도 넣을 수 있습니다.
 하지만 피그마처럼 위치의 배치는 이루어지지 않게 될 겁니다.
 네비게이션 자체 검색바는 세그먼트보다 아래로 내려오게 될 겁니다.
 네비게이션 자체 검색바는 네비게이션 타이틀 보다 아래 위치하기 때문이죠
 
 그래서 UIView를 따로 생성해서 거기서 원하는 네비게이션바를 직접 생성후 제약조건을 걸어주셔야 하단 뷰를 스클로해도 계속 고정되어 화면에 보이게 됩니다.
 */
class HomeHeaderView: UIView {
    
    //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Property
    
    /// 상단 검색 바
    public lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .clear
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 12
        searchBar.backgroundImage = UIImage()
        
        /* 돋보기 아이콘 및 여백 제거 */
        searchBar.searchTextField.leftView = nil
        return searchBar
    }()
    
    /// 상단 벨 아이콘
    private lazy var topBell: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bell.pdf")
        return imageView
    }()
    
    /// 상단 세그먼트 컨트롤
    public lazy var segmentControl: HomeSegmentControl = {
        let items = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
        let segmentControl = HomeSegmentControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()
    
    /// 크림앱을 직접 다운로드해서 자세히보면 구분선을 가지고 있습니다. 그것을 표현하기 위해 작성합니다.
    private lazy var bottomBorder: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
    }()
    
    /// 컴포넌트 생성
    private func addComponents() {
        [searchBar, topBell, segmentControl,bottomBorder].forEach { self.addSubview($0) }
    }
    
    /// 제약 조건 설정
    private func constraints() {
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.left.equalTo(16)
            $0.right.equalTo(topBell.snp.left).offset(-15)
        }
        
        topBell.snp.makeConstraints {
            $0.centerY.equalTo(searchBar.snp.centerY)
            $0.right.equalToSuperview().offset(-16)
            $0.width.height.equalTo(24)
        }
        
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(14)
            $0.right.equalToSuperview().offset(-15)
            $0.height.equalTo(27)
        }
        
        bottomBorder.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(segmentControl.snp.bottom).offset(1)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
    }

}
