//
//  SelectSizeViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit

struct ReceivePurchaseData {
    let image: UIImage
    let productName: String
    let prodcutDescription: String
}

class SelectSizeViewController: UIViewController {
    
    let data = SizeData.sizeData
    var receiveData: ReceivePurchaseData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        changeValue()
    }
    
    override func loadView() {
        self.view = purchaseSelectSizeView
    }
    
    
    private lazy var purchaseSelectSizeView: PurchaseSelectSizeView = {
        let view = PurchaseSelectSizeView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        return view
    }()
    
    private func changeValue() {
        if let data = receiveData {
            purchaseSelectSizeView.changeValue(data: data)
        }
    }
    
    private func setNavigation() {
        self.navigationItem.titleView = CustomNavigationTitle(frame: .zero, titleText: "구매하기", subTitleText: "(가격 단위:원)")
        
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(closeButtonTapped))
        closeButton.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = closeButton
    }
    
    @objc private func closeButtonTapped() {
            dismiss(animated: true, completion: nil)
        }
}

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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SizeCell {
            cell.changeOption(isSelected: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SizeCell {
            cell.changeOption(isSelected: false)
        }
    }
    
}
