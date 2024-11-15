//
//  PurchaseViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit

/// 구매버튼 뷰 컨트롤러
/// 피그마의 6주차 점퍼 구매 뷰
/// 네비게이션 컨트롤러가 아니기 때문에, 해당 뷰를 부르기 위해 NavigationController를 통해 불러야함! 그래야 상단 네비게이션 아이템을 불러올 수 있음
class PurchaseViewController: UIViewController {
    
    let data = PurchaseData.purchaseData

    // MARK: - Init
    
    /// 네비게이션 적용함수, 메인 사진 클릭시 액션, 구매 버튼 클릭시 뷰 전환 액션 추가
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setDefaultSelection()
        addTapGesture()
    }
    
    /// viewDidLoad()와 분리하여, 네비게이션을 부르는게 아닌 네비게이션 영역을 제외한 뷰를 부른다. 커스텀한 뷰를 부르드록 overrride 적용
    override func loadView() {
        self.view = purchaseView
    }
    
    // MARK: - Property
    
    /// 커스텀한 구매 뷰
    private lazy var purchaseView: PurchaseView = {
        let view = PurchaseView()
        view.productCollectionView.delegate = self
        view.productCollectionView.dataSource = self
        return view
    }()
    
    // MARK: - Function
    
    /// 네비게이션 아이템 지정, SFSymbol을 톨해 이미지를 가져오고, 렌더링모드를 통해 해당 이미지를 블랙처리, 또한 액션을 지정하여 이전화면으로 돌아갈 수 있도록 함
    private func setupNavigationBar() {
        let item = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), style: .plain, target: self, action: #selector(handleBackButton))
        self.navigationItem.leftBarButtonItem = item
    }
    
    /// 커스텀한 구매 또는 판매 버튼은 UIButton 타입이 아닌 UIView 타입이기 때문에 Gesture를 추가하여 사용자의 인터랙션을 감지 할 수 있도록 한다
    /// 구매하기 버튼의 액션 추가
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        purchaseView.leftPurchaseBtn.addGestureRecognizer(tapGesture)
    }
    
    /// 하나의 상품에 대해 다른 색상의 상품 셀을 클릭했을 때, 대표 사진 및 설명 텍스트 부분 바뀌도록 설정하는 함수
    /// - Parameter indexPath: 선택한 셀의 인덱스
    private func updateSelectedImage(for indexPath: IndexPath) {
        purchaseView.productImageView.image = UIImage(named: data[indexPath.item].imageView)
        purchaseView.productDescription.text = data[indexPath.item].productName
    }
    
    /// 구매 뷰에 처음 접근했을 때, 컬렉션의 첫번째 셀이 대표 사진으로 선택되어 있으면서, 첫번째 셀의 값이 다른 UIComponents의 값으로 사용되도록 지정
    private func setDefaultSelection() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        updateSelectedImage(for: firstIndexPath)
    }
    
    // MARK: - Action Function

    /// 좌측 네비게이션 아이템 클릭 시, 화면 닫기
    @objc private func handleBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    /// 구매 버튼 클릭 시, 사이즈 선택 화면을 전환
    @objc func buttonTapped() {
        let newViewController = SelectSizeViewController()
        /*
                3주차 워크북에서 데이터 전달 개념
            구매 버튼에서 원하는 색상의 점퍼를 클릭하고, 구매하기 버튼을 클릭하면 선택한 점퍼의 사진과 이름, 설명을 전달한다.
         */
        newViewController.receiveData = ReceivePurchaseData(image: purchaseView.productImageView.image ?? UIImage(),
                                                            productName: purchaseView.productName.text ?? "전달 못했음",
                                                            prodcutDescription: purchaseView.productDescription.text ?? "전달 못했음")
        let navigationController = UINavigationController(rootViewController: newViewController)
        
        navigationController.modalPresentationStyle = .pageSheet
        present(navigationController, animated: true, completion: nil)
    }
}

// MARK: - Extension

extension PurchaseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PurchaseCell.identifier, for: indexPath) as? PurchaseCell else { return UICollectionViewCell() }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    /// 컬렉션 뷰 섹션 내부 여백 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
    }
    
    /// 컬렉션 뷰의 아이템(하나의 셀)을 클릭했을 때, 처리되어야 할 것 지정
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateSelectedImage(for: indexPath)
    }
}
