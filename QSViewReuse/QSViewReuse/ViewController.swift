//
//  ViewController.swift
//  QSViewReuse
//
//  Created by Song on 2020/7/9.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Widget
    private lazy var tableView: UITableView = {
        let view = UITableView.init(frame: .zero)
        view.dataSource = self
        view.delegate = self
        
        // 注册
        view.qs.registerCell(cls: UITableViewCell.self)
        view.qs.registerHeaderFooter(cls: UITableViewHeaderFooterView.self)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
        layout.estimatedItemSize = CGSize.init(width: 60.0, height: 60.0)
        
        let view = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        
        // 注册
        view.qs.registerCell(cls: UICollectionViewCell.self)
        view.qs.registerHeaderFooter(cls: UICollectionReusableView.self, kind: .header)
        view.qs.registerHeaderFooter(cls: UICollectionReusableView.self, kind: .footer)
        
        return view
    }()
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.qs.dequeueReusableCell(UITableViewCell.self)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.qs.dequeueReusableHeaderFooter(UITableViewHeaderFooterView.self)
        
        return headerView
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.qs.dequeueReusableCell(UICollectionViewCell.self, indexPath: indexPath)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let kind = QSCollectionHeaderFooterKind.init(rawValue: kind)!
        
        switch kind {
        case .header:
            let headerView = collectionView.qs.dequeueReusableHeaderFooter(UICollectionReusableView.self, kind: kind, indexPath: indexPath)
            
            return headerView
        case .footer:
            let footerView = collectionView.qs.dequeueReusableHeaderFooter(UICollectionReusableView.self, kind: kind, indexPath: indexPath)
            
            return footerView
        }
    }
}
