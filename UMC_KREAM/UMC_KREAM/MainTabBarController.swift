//
//  MainTabBarController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit

/// KREAM 탭바컨트롤러
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        appearance()
    }
    
    
    /// 탭바 설정 함수(피그마 디자인에 맞춰 5개 구성)
    private func setupTabBar() {
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), tag: 1)
        
        let StyleVC = UINavigationController(rootViewController: StyleViewController())
        StyleVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Style"), tag: 2)
        
        let ShopVC = UINavigationController(rootViewController: ShopViewController())
        ShopVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Shop.pdf"), tag: 3)
        
        let SavedVC = UINavigationController(rootViewController: SavedViewController())
        SavedVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Saved.pdf"), tag: 4)
        
        let MyVC = UINavigationController(rootViewController: MyPageViewController())
        MyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "My.pdf"), tag: 5)
        
        self.viewControllers = [homeVC, StyleVC, ShopVC, SavedVC, MyVC]
        
    }
    
    /// 클릭 시, 검은색으로 칠해지도록 Aprrearance 조정 함수
    private func appearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        barAppearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.black
        barAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.black
        
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.backgroundColor = .clear
    }
           

}
