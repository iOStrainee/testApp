//
//  MenuCollectionViewController.swift
//  bambook
//
//  Created by Admin on 02.10.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

private let reuseIdentifierCategoryDish = "Cell"
private let reuseIdentifierHeader = "main header"

class MenuCollectionViewController: UICollectionViewController {
    
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
    
    //MARK: - properties tab bar height and model
    var tabBarHeightPadding = CGFloat(0.0)
    var categoryViewModel:MainCategoryMenuViewModel!
    
    
    //MARK: - properties push custom transition object
    var customPush:CategoryToTransitionNavigationController?
    var imageForCustom:UIImage?
    var imageFrameCustom:CGRect?
    
    var customView:UIView = {
       let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        view.frame.size = CGSize(width: 100.0, height: 50.0)
        view.frame.origin = CGPoint(x: 0.0, y: 0.0)
        return view
    }()
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.delegate = self // for custom transition
        
        self.createNavigationItems() // navigation items at right and left
        self.settingsNavigationBar() // text: title, font, color. bar: backgroundColor
        self.settingsCollectionView() // register cells and header
        self.tabBarHeightandModel() // getting height and initialize model
    }
    //MARK: - settings navigationBar
    private func settingsNavigationBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.appetite24()]
        self.navigationController?.navigationBar.barTintColor = UIColor.mainColor()
        self.navigationItem.title = "Меню"
    }
    
    //MARK: - settings collectionView
    private func settingsCollectionView() {
        self.collectionView!.register(CategoryDishesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifierCategoryDish)
        self.collectionView?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader)
        self.collectionView.backgroundColor = UIColor.black
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
        
        // we must required return to here , because it has very big perspective for impressive animation
        
        //        if let bar = navigationController?.navigationBar {
        //
        //            bar.barTintColor = UIColor.clear
        
//                    let heightStatusbar = UIApplication.shared.statusBarFrame.height
        //            let tempView = UIView(frame: bar.subviews[0].frame)
        //            tempView.backgroundColor = UIColor.mainColor()
        //            tempView.frame.origin.y -= heightStatusbar
        //
        //            tempView.frame.size.height += heightStatusbar
        //            tempView.frame.size.width = bar.frame.width
        //            tempView.translatesAutoresizingMaskIntoConstraints = true
        //            tempView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        //            bar.insertSubview(v, at: 1)
        //        }
    }
    
    //MARK: - height tabbar and initalize model
    private func tabBarHeightandModel() {
        guard let height = self.tabBarController?.tabBar.bounds.height else {
            print("fail get height tabbar")
            return
        }
        self.tabBarHeightPadding = height + 16.0
        self.categoryViewModel = MainCategoryMenuViewModel(delegate: self)
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoryViewModel.countRow
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCategoryDish, for: indexPath) as? CategoryDishesCollectionViewCell else {
            print("fail convert CategoryDishesCollectionViewCell")
            return UICollectionViewCell()
        }
        cell.item = self.categoryViewModel.dataItems[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader, for: indexPath) as? HeaderCollectionReusableView else {
              return  UICollectionReusableView()
            }
            return header
        default:
            print("default header view")
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 240.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0.5
        cell.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.8) {
            cell.transform = CGAffineTransform.identity
            cell.alpha = 1.0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = collectionView.cellForItem(at: indexPath) as? CategoryDishesCollectionViewCell else {return}
        guard let itemAttributes = collectionView.layoutAttributesForItem(at: indexPath) else {return}
        print("frame image in cell = \(item.imageObject.frame)")
        print("frame attribute = \(itemAttributes.frame)")
        let selectFrame = collectionView.convert(item.frame, to: collectionView.superview)
        self.imageFrameCustom = CGRect(x: selectFrame.minX, y: selectFrame.minY, width: item.imageObject.frame.size.width, height: item.imageObject.frame.height)
        self.imageForCustom = item.imageObject.image
        let dishesFromCategory = DishesByCategoryCollectionViewController(id: self.categoryViewModel.dataItems[indexPath.row].id!)
        print("navigation controller navbar title = \(self.navigationController?.navigationBar.topItem?.title)")
        dishesFromCategory.navigationItem.title = item.nameOfCategory.text
        navigationController?.pushViewController(dishesFromCategory, animated: true)
    }
}

//MARK: - delegate collection view flow layout
extension MenuCollectionViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = CGFloat(16.0*2.0)
        return CGSize(width: (collectionView.bounds.width/2.0) - padding, height: (collectionView.bounds.height/2.0) - padding)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16.0, left: 16.0, bottom: self.tabBarHeightPadding, right: 16.0)
    }
}

//MARK: - delegate viewModelDelegate conforms
extension MenuCollectionViewController: ViewModelDelegate {
    
    func willLoadAnimation() {
        // start animation
        print("data is will load")
    }
    
    func didLoadAnimation() {
        // end animation
        print("data is did load")
        collectionView.reloadData()
    }
    
    func hasError() {
        // has error
        print("has error on category menu")
    }
    
    //this is optional function has constraint in Protocols
    func dataTransfer<Template>(conformViewModelDelegate: Template) where Template : ViewModelDelegate {
        // data retrieve
    }
}

//MARK: - custom transition delegate protocol
extension MenuCollectionViewController:UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        guard let customImage = imageForCustom else {
            print("custom image fail retrieve")
            return nil
        }
        guard let customFrame = imageFrameCustom else {
            print("custom frame fail retrieve")
            return nil
        }

        self.customPush = CategoryToTransitionNavigationController(image: customImage, coordinate: customFrame.origin, duration: 1.0, size: customFrame.size)

        switch operation {
        case .push:
            print("push")
            return customPush
        default:
            print("another case")
            return nil
        }
    }
}
