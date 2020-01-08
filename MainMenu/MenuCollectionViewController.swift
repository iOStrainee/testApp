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

    //properties for navigationBar design
    var labelNavBar:UILabel = {
        let view = UILabel()
        view.text = "Меню"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor.white
        view.adjustsFontSizeToFitWidth = true
        view.font = UIFont.appetite24()
        view.minimumScaleFactor = 0.5
        view.contentScaleFactor = 0.3
        view.textAlignment = .center
       return view
    }()
    var navBar:UINavigationBar = UINavigationBar()
    
    var navBarView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
       return view
    }()
    var leftView:UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.colorRectangle()
        return view
    }()
    var rightView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.colorRectangle()
        return view
    }()
    
    var tabBarHeightPadding = CGFloat(0.0)
    var categoryViewModel:MainCategoryMenuViewModel!
    
    //MARK: - push custom transition object
    var customPush:CategoryToTransitionNavigationController?
    var imageForCustom:UIImage?
    var imageFrameCustom:CGRect?
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let temp = self.navigationController?.navigationBar {
            self.navBar = temp
            self.navBarView.bounds.size = temp.bounds.size
        }
        self.addNavbarCustomView()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.mainColor()
        
        // MARK: - register Cell and Header
        self.collectionView!.register(CategoryDishesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifierCategoryDish)
        self.collectionView?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader)
        self.collectionView.backgroundColor = UIColor.black
//        self.navigationController?.delegate = self
//        self.navigationItem.title = "Меню"
//        self.navigationController?.navigationBar.topItem?.title = "Mey.."
        self.navigationController?.navigationBar.backItem?.title = "назад"
        
        //MARK:- get height tabbar + padding 16.0 point
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
        self.navBarView.isHidden = true
        
        guard let item = collectionView.cellForItem(at: indexPath) as? CategoryDishesCollectionViewCell else {return}
        guard let itemAttributes = collectionView.layoutAttributesForItem(at: indexPath) else {return}
        print("frame image in cell = \(item.imageObject.frame)")
        print("frame attribute = \(itemAttributes.frame)")
        let selectFrame = collectionView.convert(item.frame, to: collectionView.superview)
        self.imageFrameCustom = CGRect(x: selectFrame.minX, y: selectFrame.minY, width: item.imageObject.frame.size.width, height: item.imageObject.frame.height)
        self.imageForCustom = item.imageObject.image
        let dishesFromCategory = DishesByCategoryCollectionViewController(id: self.categoryViewModel.dataItems[indexPath.row].id!)
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

//MARK: - viewModelDelegate conforms
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

//MARK: - layout subView constraints
extension MenuCollectionViewController {
    
    private func addNavbarCustomView() {
        self.navBar.addSubview(self.navBarView)
        self.navBarView.addSubview(self.labelNavBar)
        self.navBarView.addSubview(self.leftView)
        self.navBarView.addSubview(self.rightView)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //constraint for navbar subview
        self.navBarView.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor).isActive = true
        self.navBarView.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor).isActive = true
        self.navBarView.topAnchor.constraint(equalTo: self.navBar.topAnchor).isActive = true
        self.navBarView.bottomAnchor.constraint(equalTo: self.navBar.bottomAnchor).isActive = true
        self.navBarView.widthAnchor.constraint(equalTo: self.navBar.widthAnchor).isActive = true
        self.navBarView.heightAnchor.constraint(equalTo: self.navBar.heightAnchor).isActive = true
        
        self.labelNavBar.centerXAnchor.constraint(equalTo: self.navBarView.centerXAnchor).isActive = true
        self.labelNavBar.centerYAnchor.constraint(equalTo: self.navBarView.centerYAnchor).isActive = true
        self.labelNavBar.widthAnchor.constraint(equalTo: self.navBarView.widthAnchor, multiplier: 1/3).isActive = true
        self.labelNavBar.heightAnchor.constraint(equalTo: self.navBarView.heightAnchor, multiplier: 1/2).isActive = true
        
        self.leftView.leadingAnchor.constraint(equalTo: self.navBarView.leadingAnchor, constant: 2.0).isActive = true
        self.leftView.trailingAnchor.constraint(equalTo: self.labelNavBar.leadingAnchor, constant: -5.0).isActive = true
        self.leftView.centerYAnchor.constraint(equalTo: self.labelNavBar.centerYAnchor).isActive = true
        self.leftView.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
        
        self.rightView.leadingAnchor.constraint(equalTo: self.labelNavBar.trailingAnchor, constant: 2.0).isActive = true
        self.rightView.trailingAnchor.constraint(equalTo: self.navBarView.trailingAnchor, constant: -5.0).isActive = true
        self.rightView.centerYAnchor.constraint(equalTo: self.labelNavBar.centerYAnchor).isActive = true
        self.rightView.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
    }
    
}
