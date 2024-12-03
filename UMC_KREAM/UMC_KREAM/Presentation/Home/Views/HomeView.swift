//
//  HomeView.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 11/12/24.
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
        
        /*
         크립앱의 홈탭에서 상단 커스텀 네비게이션을 제외한 뷰는 컬렉션 뷰이고
         이 하나의 컬렉션 뷰가 여러개의 섹션을 가지고 있고, 섹션마다 자신의 셀 패턴을 가지고 있습니다.
         그래서 4주차에서 자세한 언급은 없었지만 레이아웃이라는 놈을 우리가 직접 조정하여 이 하나의 컬렉션뷰가 사용할 수 있도록하면
         우리가 원하는 부분의 섹션에서 원하는 스타일의 셀을 갖도록 할 수 있습니다.
         즉, 크림앱은 4개의 섹션을 갖고 있고, 각 섹션은 자신만의 셀 패턴을 갖고 있으니, 그 셀 패턴을 갖도록 레이아웃을 구성해주면 됩니다.
         */
        let layout = HomeCollectionLayout.createCompositionalLayout()
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        
        /* 셀 등록 */
        /*
         크림앱에는 규칙적인 셀 패턴을 가지고 있습니다.
         만약 이걸 하나하나 뷰로 구현해서 했다면 틀렸습니다..ㅎ....
         중복되는 셀의 종류를 파악하여 셀을 등록 해두고 필요로 하는 섹션에서 셀을 불러와서 사용할 수 있도록 해줍니다.
         */
        collectionView.register(AdBannerCell.self, forCellWithReuseIdentifier: AdBannerCell.identifier)
        collectionView.register(RecommendationCell.self, forCellWithReuseIdentifier: RecommendationCell.identifier)
        collectionView.register(ProductGridCell.self, forCellWithReuseIdentifier: ProductGridCell.identifier)
        collectionView.register(UserStoryCell.self, forCellWithReuseIdentifier: UserStoryCell.identifier)
        
        /* 헤더 및 푸터 등록 */
        
        /* 셀이 끝나는 지점마다 공통적으로 같은 간격을 가지고 구분선이 생성되고 있습니다. 즉, 푸터로 구분선을 두어 모든 섹션이 구분선을 보이도록 했습니다.
         대신 모든 섹션은 각자 자신만의 높이를 갖고 있기때문에 섹션의 높이는 다릅니다. 그래서 높이가 다르더라도 셀 아이템이 끝나는 지점부터 일정 거리를 두어 구분선을 두어 자동으로 생성되도록 구성했습니다.
         */
        collectionView.register(SectionSeparatorFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SectionSeparatorFooter.identifier)
        
        /*
         어느 섹션에 대해서는 헤더를 들고 있고, 공통적인 컴포넌트를 가지고 있습니다. 그래서 하나의 헤더만 등록하고 원하는 섹션에서 헤더를 사용할 수 있도록 지정합니다.
         */
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
    
    /// 제약 조건 설정
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
