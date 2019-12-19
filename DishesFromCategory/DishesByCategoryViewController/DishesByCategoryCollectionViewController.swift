//
//  DishesByCategoryCollectionViewController.swift
//  bambook
//
//  Created by Admin on 21/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "dishesCategory"
private let reuseIdentifierHeader = "header"

class DishesByCategoryCollectionViewController: UICollectionViewController {

    var dishesByCategoryViewModel:DishesCategoryViewModel!
    var tabbarHeight:CGFloat = 0.0
    var sizeCustom:CGSize = .zero
    var centerHeader:CGPoint = .zero
    
    var imageCustom:UIImage = UIImage() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    convenience init(id:Int) {
        self.init(id: id, collectionFlowLayout: UICollectionViewFlowLayout())
        self.dishesByCategoryViewModel = DishesCategoryViewModel(idCategory: id, delegateObject: self)
    }
    
    init(id:Int,collectionFlowLayout:UICollectionViewLayout) {
        super.init(collectionViewLayout: collectionFlowLayout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = UIColor.black
        
        //MARK: - register cell and header
        
        self.collectionView!.register(DishesFromCategoryCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(DishesCategoryHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader)
        
        guard let heighttabbar = tabBarController?.tabBar.bounds.height else {return}
        tabbarHeight = heighttabbar + 16.0
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dishesByCategoryViewModel.countRow
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? DishesFromCategoryCollectionViewCell else {return UICollectionViewCell()}
        cell.itemData = self.dishesByCategoryViewModel.items?.dishes?[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader, for: indexPath) as? DishesCategoryHeaderReusableView else {
            return UICollectionReusableView()
        }
        guard let inform = collectionView.layoutAttributesForSupplementaryElement(ofKind: UICollectionView.elementKindSectionHeader, at: indexPath) else {return UICollectionReusableView()}
        let converts = collectionView.convert(inform.frame, to: collectionView.superview)
        
        header.sizeImage = sizeCustom
        header.imageView.image = imageCustom
        centerHeader = CGPoint(x: converts.midX, y: converts.midY)
        return header
    }
    
    //MARK: - didSelect
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DishesFromCategoryCollectionViewCell else {return}
        print(cell.nameOfDishes.text)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
//MARK: - flow delegate

extension DishesByCategoryCollectionViewController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16.0, left: 16.0, bottom: tabbarHeight, right: 16.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = CGFloat(16*2.0)
        return  CGSize(width: collectionView.bounds.width/2.0-padding, height: collectionView.bounds.height/2.0-padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 260)
    }
}

//MARK: - conforms to ViewModelDelegate

extension DishesByCategoryCollectionViewController:ViewModelDelegate {
    func willLoadAnimation() {
        print("dishes category view controller willLoadAnimation")
    }
    
    func didLoadAnimation() {
        print("dishes category view contorller didLoadAnimation")
        collectionView.reloadData()
    }
    
    func hasError() {
        print("dishes category view controller hasError")
    }
}
