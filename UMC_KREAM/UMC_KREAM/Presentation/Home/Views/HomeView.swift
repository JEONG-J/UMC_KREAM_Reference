//
//  HomeView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/12/24.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Property
    public lazy var homeCollectionView: UICollectionView = {
        
        let layout = HomeCollectionLayout.createCompositionalLayout()
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        
        /* 셀 등록 */
        
        collectionView.register(AdBannerCell.self, forCellWithReuseIdentifier: AdBannerCell.identifier)
        collectionView.register(RecommendationCell.self, forCellWithReuseIdentifier: RecommendationCell.identifier)
        collectionView.register(ProductGridCell.self, forCellWithReuseIdentifier: ProductGridCell.identifier)
        collectionView.register(UserStoryCell.self, forCellWithReuseIdentifier: UserStoryCell.identifier)
        
        /* 헤더 및 푸터 등록 */
        
        collectionView.register(SectionSeparatorFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SectionSeparatorFooter.identifier)
        collectionView.register(BaseCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BaseCellHeader.identifier)
        
        collectionView.backgroundColor = .white
        collectionView.refreshControl = refreshControl
        return collectionView
    }()
    
    /// 상단 헤더 뷰
    public lazy var homeHeaderView: HomeHeaderView = HomeHeaderView()
    
    /// 컬렉션 뷰 상단에서 잡아당길 때 리프레시 버튼 생성
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    // MARK: - Function
    
    /// 1.0초 동안 리프레시 버튼 재생
    @objc private func pullRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.refreshControl.endRefreshing()
        })
    }
    
    // MARK: - Constaints & Add Function
    
    /// 컴포넌트 생성
    private func addComponents() {
        [homeHeaderView, homeCollectionView].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        
        homeHeaderView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(homeHeaderView.snp.bottom).offset(0)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}
