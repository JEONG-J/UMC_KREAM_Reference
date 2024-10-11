//
//  MyPageViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit

/// 마이 페이지 뷰 컨트롤러
class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = myPageView
    }
    
    /// 커스텀한 마이페이지 뷰
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        view.topView.profileManageBtn.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        return view
    }()
    
    /// 프로필 관리 버튼을 통해 프로필 수정 페이지 이동
    @objc func changePage() {
        let changeVC = MyPageManageViewController()
        navigationController?.pushViewController(changeVC, animated: true)
    }
}
