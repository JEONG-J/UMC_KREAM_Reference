//
//  SelectSizeViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit

/// 사이즈 선택 화면에서 받아야 할 데이터 구조체
struct ReceivePurchaseData {
    let image: UIImage
    let productName: String
    let prodcutDescription: String
}

/// 사이즈 선택 뷰 컨트롤러
/// 점퍼 구매 뷰에서 구매 버튼 클릭 후 넘어오는 뷰 컨트롤러
/// 네비게이션 컨트롤러가 아니기 때문에, 해당 뷰를 부르기 위해 NavigationController를 통해 불러야함! 그래야 상단 네비게이션 타이틀뷰와 아이템을 불러올 수 있음
class SelectSizeViewController: UIViewController {
    
    let data = SizeData.sizeData
    var receiveData: ReceivePurchaseData?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        changeValue()
    }
    
    /// viewDidLoad()와 분리하여, 네비게이션을 부르는게 아닌 네비게이션 영역을 제외한 뷰를 부른다. 커스텀한 뷰를 부르드록 overrride 적용
    override func loadView() {
        self.view = purchaseSelectSizeView
    }
    
    // MARK: - Property
    
    /// MARK: - 커스텀한 사이즈 선택 뷰
    private lazy var purchaseSelectSizeView: PurchaseSelectSizeView = {
        let view = PurchaseSelectSizeView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        return view
    }()
    
    /// 구매 뷰에서 원하는 점퍼의 색상을 선택 후, 구매버튼을 클릭하여 사이즈 선택 뷰 컨트롤러로 넘어오면서 전달받은 값이 적용되어 보이도록 처리
    private func changeValue() {
        if let data = receiveData {
            purchaseSelectSizeView.changeValue(data: data)
        }
    }
    
    // MARK: - Function
    
    /// 커스텀 네비게이션 타이틀 뷰 및 우측 닫기 버튼 생서
    private func setNavigation() {
        self.navigationItem.titleView = CustomNavigationTitle(frame: .zero, titleText: "구매하기", subTitleText: "(가격 단위:원)")
        
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(closeButtonTapped))
        closeButton.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = closeButton
    }
    
    /// 우측 네비게이션 아이템 클릭 시 닫기 액션
    @objc private func closeButtonTapped() {
            dismiss(animated: true, completion: nil)
        }
}

// MARK: - Extension
extension SelectSizeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCell.identifier, for: indexPath) as? SizeCell else { return UICollectionViewCell() }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 47)
    }
    
    /// 셀 내부 여백 처리
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
        
    /// 셀 아이템 선택 시 처리
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SizeCell {
            cell.changeOption(isSelected: true)
        }
    }
    /// 셀 아이템 선택 해제 시 처리
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SizeCell {
            cell.changeOption(isSelected: false)
        }
    }
    
}
