//
//  PurchaseViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 11/14/24.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    let data = PurchaseData.purchaseData

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setDefaultSelection()
        addTapGesture()
    }
    
    override func loadView() {
        self.view = purchaseView
    }
    
    private lazy var purchaseView: PurchaseView = {
        let view = PurchaseView()
        view.productCollectionView.delegate = self
        view.productCollectionView.dataSource = self
        return view
    }()
    
    private func setupNavigationBar() {
        let item = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), style: .plain, target: self, action: #selector(handleBackButton))
        self.navigationItem.leftBarButtonItem = item
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        purchaseView.leftPurchaseBtn.addGestureRecognizer(tapGesture)
    }
    
   
    
    private func updateSelectedImage(for indexPath: IndexPath) {
        purchaseView.productImageView.image = UIImage(named: data[indexPath.item].imageView)
        purchaseView.productDescription.text = data[indexPath.item].productName
    }
    
    private func setDefaultSelection() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        updateSelectedImage(for: firstIndexPath)
    }

    @objc private func handleBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func buttonTapped() {
        let newViewController = SelectSizeViewController()
        newViewController.receiveData = ReceivePurchaseData(image: purchaseView.productImageView.image ?? UIImage(),
                                                            productName: purchaseView.productName.text ?? "전달 못했음",
                                                            prodcutDescription: purchaseView.productDescription.text ?? "전달 못했음")
        let navigationController = UINavigationController(rootViewController: newViewController)
        
        navigationController.modalPresentationStyle = .pageSheet
        present(navigationController, animated: true, completion: nil)
    }
}

extension PurchaseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PurchaseCell.identifier, for: indexPath) as? PurchaseCell else { return UICollectionViewCell() }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateSelectedImage(for: indexPath)
    }
}
