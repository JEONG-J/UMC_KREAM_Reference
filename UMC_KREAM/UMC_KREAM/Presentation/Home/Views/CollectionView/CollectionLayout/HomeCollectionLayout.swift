//
//  HomeCollectionLayout.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/13/24.
//

import UIKit

/// 홈탭의 커스텀 컬렉션뷰 레이아웃
class HomeCollectionLayout {
    
    /// 컬렉션뷰가 가지는 레이아웃 지정
    /// - Returns: 크림앱은 4가지 섹션을 가지고 있으니, 해당 케이스에 맞춰 섹션이 반환되도록 레이아웃 생성한다.
    static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                return createBannerSection()
            case 1:
                return createRecommendationSection()
            case 2:
                return createProductGridSection()
            case 3:
                return createUserStorySection()
            default:
                return nil
            }
        }
    }
    
    /*
     --------------------------------------------
     !!!! 코드 한줄 한줄 주석 설명을 꼭 읽어주세요.. !!!!!
     --------------------------------------------
     */
    
    /// 배너 섹션 생성
    private static func createBannerSection() -> NSCollectionLayoutSection {
        
        /*
         itemSize는 셀 하나의 아이템을 의미합니다.
         .fraction은 지정된 셀크기의 퍼센트 비율을 의미합니다. 동적으로 조정이 가능하죠!
         셀 아이템 크기에 맞춰 비율로 조정됩니다.
         .absolute는 고정 값입니다. 저 값을 무조건 지키게 됩니다.
         */
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(336))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        /* 셀을 담는 전체 그룹을 의미합니다. 배너 사진은 사진 크기만큼 셀 크기를 가지고 그게 곧 그룹 사이즈가 됩니다. 그래서 아이템 사이즈와 동일하게 설정합니다. */
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(336))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        /* 섹션 크기를 지정합니다. 섹션은 (헤더 + 셀 부분 + 푸터)을 의미합니다. 하지만 배너에서는 헤더와 푸터가 없기 때문에 자체 사진 크기 즉, 그룹 사이즈가 섹션 사이즈로 값을 가지면 됩니다. */
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
    /// 추천 섹션 반환
    /// - Returns: 추천 섹션의 아이템, 컬렉션 그룹 사이즈 값을 적용하여 섹션 반환
    private static func createRecommendationSection() -> NSCollectionLayoutSection {
        
        /*
         한줄에 5개의 이미지 총 2줄이 필요합니다. 한줄을 1이라 보고 한줄에 5개의 아이템이 들어가야 합니다. 즉, 아이템의 가로 사이즈는 1/5 = 0.2 입니다.
         fraction으로 0.2를 주면 아이템이 한줄에 5개가 최대가 됩니다.
         높이는 당연히 고정크기를 가지면 됩니다.
         */
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .absolute(81))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 각 아이템의 간격을 설정
        /*
         한줄당 하나의 그룹입니다.
         우리는 두 줄이 생성되야 하니깐 두개의 그룹이 생성된다 생각하면 됩니다.
         아이템 사이즈에 맞춰 그룹을 생성하면 너무 딱 달라붙기 때문에 일부러 heightDimension에 10만큼 더 길게 absolute값을 주었습니다.
         */
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(91))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        /* 그룹간의 간격입니다. 각 그룹 즉, 각 줄끼리의 사이 간격을 주기 위해 값을 넣었습니다. */
        group.interItemSpacing = .fixed(8)

        
        let section = NSCollectionLayoutSection(group: group)
        
        /* 섹션 내부 여백 지정, 추천 섹션은 헤더는 없지만 푸터가 있습니다. 바로 구분선입니다. 셀 그룹이 끝나는 지점으로부터 30 떨어진 지점에 푸터가 생성될 수 있도록 bottom에 30을 넣어줍니다. 다른 부분의 여백 값은 피그마를 통해 수치대로 넣었습니다. */
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 30, trailing: 15)
        section.boundarySupplementaryItems = [createFooterItem()]
        
        return section
    }
    
    /// Grid형 상품 섹션 생성
    private static func createProductGridSection() -> NSCollectionLayoutSection {
        /*
         피그마의 Just Dropped, 발매 상품 부분입니다. 일반적으로 한줄의 가로형으로 셀들을 펼쳐 놓은 레이아웃입니다.
         이 부분은 한줄에 쭉 나열되기 떄문에 고정된 값의 가로 길이와 세로 길이를 가지면 됩니다.
         */
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(142), heightDimension: .absolute(237))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        /*
         한줄로 나열하는 레이아웃이기 때문에 하나의 아이템이 하나의 그룹입니다. 하나의 아이템 옆에 바로 아이템이 달라붙는게 아닌 공백을 가지고 아이템이 옆에 생성되기 때문에 가로 크기를 좀 더 주어 여백을 만들어주었습니다.
         */
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(152), heightDimension: .absolute(237))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        
        /* 이 섹션부분은 가로로 나열되는 형태이기 때문에 continuous를 주도록 합니다. */
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 10, bottom: 30, trailing: 10)
        
        /* 이 섹션은 헤더(상단 타이틀 라벨)와 푸터(구분선)를 가지고 있기 때문에 바운더리에 헤더와 푸터를 넣어줍니다. */
        section.boundarySupplementaryItems = [createHeaderItem(), createFooterItem()]
        return section
    }
    
    /// 유저 스토리 섹션 생성
    /// 위의 Grid형 상품 섹션과 동일합니다. 생략하겠습니다!!
    private static func createUserStorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(124), heightDimension: .absolute(165))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(134), heightDimension: .absolute(165))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 10, bottom: 30, trailing: 10)
        section.boundarySupplementaryItems = [createHeaderItem(), createFooterItem()]
        
        return section
    }
    
    /// 푸터 생성(구분선)
    /// - Returns: 구분선을 가로(동적 사이즈), 세로(고정 사이즈)로 조정하여 각 섹션마다 생성할 수 있도록 푸터 반환
    private static func createFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        
        /*
         구분선이 푸터입니다. 즉 구분선의 길이를 지정합니다.
         구분 선 푸터 뷰를 따로 커스텀으로 만들어두었기 떄문에 전체 가로 길이가 되도록 fraction으로 처리합니다.
         */
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(1))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        return footer
    }
    
    /// 헤더 생성(특정 섹션에 대해 타이틀 헤더)
    /// - Returns: 고정된 헤더 반환
    private static func createHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.pinToVisibleBounds = true
        
        return header
    }
}
