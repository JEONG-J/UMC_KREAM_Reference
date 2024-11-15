//
//  HomeViewController.swift
//  UMC_KREAM
//
//  Created by UMC 7기 중앙 iOS 파트장 정의찬/제옹 on 10/8/24.
//

import UIKit

/// 홈탭 뷰컨트롤러
class HomeViewController: UIViewController {
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.view = homeView
    }
    
    //MARK: - Property
    
    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.backgroundColor = .white
        homeView.homeCollectionView.delegate = self
        homeView.homeCollectionView.dataSource = self
        return homeView
    }()
}

// MARK: Extension

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    /// 섹션 갯수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return HomeCellModel.bannerData.count
        case 1:
            return HomeCellModel.recommendProductData.count
        case 2:
            return HomeCellModel.productGridData.count
        case 3:
            return HomeCellModel.userStoryData.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdBannerCell.identifier, for: indexPath) as? AdBannerCell else { return UICollectionViewCell() }
            
            let data = HomeCellModel.bannerData
            cell.configure(model: data[indexPath.row])
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendationCell.identifier, for: indexPath) as? RecommendationCell else { return UICollectionViewCell() }
            
            let data = HomeCellModel.recommendProductData
            cell.configure(model: data[indexPath.row])
            
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductGridCell.identifier, for: indexPath) as? ProductGridCell else { return UICollectionViewCell() }
            
            let data = HomeCellModel.productGridData
            cell.configure(model: data[indexPath.row])
            
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserStoryCell.identifier, for: indexPath) as? UserStoryCell else { return UICollectionViewCell() }
            
            let data = HomeCellModel.userStoryData
            cell.configure(model: data[indexPath.row])
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


extension HomeViewController {
    /// 헤더와 푸터 추가 헤더의 경의 특정 섹션에 대해서만 추가
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionSeparatorFooter.identifier, for: indexPath) as! SectionSeparatorFooter
            return footer
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BaseCellHeader.identifier, for: indexPath) as! BaseCellHeader
            
            if indexPath.section == 2 {
                header.configure(title: "Just Dropped", subTitle: "발매 상품")
            } else if indexPath.section == 3 {
                header.configure(title: "본격 한파대비! 연말 필수템 모음", subTitle:"#해피홀릭룩챌린지")
            }
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 2 || section == 3 {
            return CGSize(width: collectionView.bounds.width, height: 50)
        } else {
            return CGSize.zero
        }
    }
    
    /// 약간의 이스터 에그?? 마지막 섹션의 첫번째 셀을 누르면 6주차의 구매 뷰를 불러온다.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 3 && indexPath.item == 0{
            let newViewController = PurchaseViewController()
            let navigationController = UINavigationController(rootViewController: newViewController)
            
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        }
    }
}
