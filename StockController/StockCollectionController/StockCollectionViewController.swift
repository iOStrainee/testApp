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

    //MARK: - properties navigationItem properties
    var leftNavCustomView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.colorRectangle()
        return view
    }()
    var leftNavItem:UIBarButtonItem = {
        let view = UIBarButtonItem()
        view.customView?.alpha = 1.0
        return view
    }()
    var rightNavCustomView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.colorRectangle()
        return view
    }()
    var rightNavItem:UIBarButtonItem = {
        let view = UIBarButtonItem()
        return view
    }()
    
    var stockViewModel:StockViewModel?
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingsNavigationBar()
        self.createNavigationItems()
        stockViewModel = StockViewModel(delegate: self)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(StockCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    //MARK: - settings navigationBar
    private func settingsNavigationBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.appetite24()]
        self.navigationController?.navigationBar.barTintColor = UIColor.mainColor()
        self.navigationItem.title = "Акции"
    }
    
    //MARK: - create navigation bar buttons
    private func createNavigationItems() {
        if let nav = self.navigationController?.navigationBar {
            self.leftNavItem.customView = self.leftNavCustomView
            self.leftNavCustomView.bounds.size = CGSize(width: nav.bounds.width*1/4, height: nav.bounds.height*1/17)
            self.navigationItem.leftBarButtonItem = self.leftNavItem
            
            self.rightNavItem.customView = self.rightNavCustomView
            self.rightNavCustomView.bounds.size = CGSize(width: nav.bounds.width*1/4, height: nav.bounds.height*1/17)
            self.navigationItem.rightBarButtonItem = self.rightNavItem
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        guard let temp = stockViewModel?.countRow else {return 0}
        print("count of cell for collectionview is equal to = \(temp)")
        return temp
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("test ")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? StockCollectionViewCell else {
            print("error cast to StockCollectionViewCell")
            return UICollectionViewCell()
        }
        cell.itemData = self.stockViewModel?.stockModel[indexPath.row]
        print("has data some stock")
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
