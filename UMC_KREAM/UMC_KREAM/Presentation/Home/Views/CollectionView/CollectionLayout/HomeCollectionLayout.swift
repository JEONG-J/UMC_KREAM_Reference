//
//  HomeCollectionLayout.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/13/24.
//

import UIKit

class HomeCollectionLayout {
    
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
    
    /// 배너 섹션 생성
    private static func createBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(336))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(336))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
    /// 추천 섹션 반환
    /// - Returns: 추천 섹션의 아이템, 컬렉션 그룹 사이즈 값을 적용하여 섹션 반환
    private static func createRecommendationSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .absolute(81))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 각 아이템의 간격을 설정
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(91))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8) // 아이템 사이 간격 설정

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 30, trailing: 15)
        section.boundarySupplementaryItems = [createFooterItem()]
        
        return section
    }
    
    /// Grid형 상품 섹션 생성
    private static func createProductGridSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(142), heightDimension: .absolute(237))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(152), heightDimension: .absolute(237))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 10, bottom: 30, trailing: 10)
        section.boundarySupplementaryItems = [createHeaderItem(), createFooterItem()]
        return section
    }
    
    /// 유저 스토리 섹션 생성
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
