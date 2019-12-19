//
//  StockCollectionViewController.swift
//  bambook
//
//  Created by Admin on 18/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "StockCell"

class StockCollectionViewController: UICollectionViewController {

    var stockViewModel:StockViewModel?
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockViewModel = StockViewModel(delegate: self)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(StockCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        guard let temp = stockViewModel?.countRow else {return 0}
        return temp
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? StockCollectionViewCell else {
            print("error cast to StockCollectionViewCell")
            return UICollectionViewCell()
        }
        cell.itemData = self.stockViewModel?.item[indexPath.row]
        return cell
    }
}

//MARK: - conforms to UICollectionViewDelegateFlowLayout
extension StockCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/2.0)
    }
}

//MARK: - conforms to ViewModelDelegate
extension StockCollectionViewController: ViewModelDelegate {
    func willLoadAnimation() {
        print("Stocks started data will load")
    }
    
    func didLoadAnimation() {
        print("Stocks data is did load animation")
        collectionView.reloadData()
    }
    
    func hasError() {
        print("Stocks has error data load")
    }
}
