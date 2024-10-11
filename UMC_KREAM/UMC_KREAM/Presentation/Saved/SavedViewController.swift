//
//  SavedViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit

/// Saved 뷰 컨트롤러
class SavedViewController: UIViewController {
    
    let data = SavedProductData.datalist

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }
    
    private lazy var savedView: SavedView = {
        let savedView = SavedView(productCount: data.count)
        savedView.tableView.delegate = self
        savedView.tableView.dataSource = self
        return savedView
    }()
}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.identifier, for: indexPath) as? SavedTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    
}
