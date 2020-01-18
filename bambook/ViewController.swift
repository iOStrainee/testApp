//
//  ViewController.swift
//  bambook
//
//  Created by Admin on 01.10.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

// here we configuire tabbar and tabbarcontroller

import UIKit

class TabBarControllerMenu: UITabBarController{
    
    var widthScroll:CGFloat = 0.0
    
    var tabScrollView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.48, green: 0.63, blue: 0.8, alpha: 1.0)
        view.frame = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 2.0)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.layer.cornerRadius = 10.0
        tabBar.layer.masksToBounds = true
        tabBar.barTintColor = UIColor(red: 0.25, green: 0.36, blue: 0.5, alpha: 1.0)
        self.configureTabBar()
        self.scrollInidcatorConfigure()
        
    }
    
    // MARK: - scroll indicator
    private func scrollInidcatorConfigure(){
        guard let countItems = tabBar.items?.count else {
            print("fail count items tabbar")
            return
        }
        widthScroll = (tabBar.bounds.width/CGFloat(countItems)) - tabBar.layer.cornerRadius
        tabBar.addSubview(tabScrollView)
        self.tabScrollView.frame = CGRect(x: 10.0, y: 0.0, width: widthScroll, height: 2.0)
    }
    
    private func configureTabBar(){
        //MARK: - menu controller
        let collectionViewFlow = UICollectionViewFlowLayout()
        let collectionViewController = MenuCollectionViewController(collectionViewLayout: collectionViewFlow)
        let navigationMenu = UINavigationController(rootViewController: collectionViewController)
        navigationMenu.tabBarItem.image = UIImage(named: "fork")?.withRenderingMode(.alwaysTemplate)
        navigationMenu.tabBarItem.title = "Меню"
        navigationMenu.tabBarItem.tag = 0
        
        //MARK: - basket controller
        
        
        //MARK: - stocks controller
        let collectionViewFlowStock = UICollectionViewFlowLayout()
        let collectionViewControllerStock = StockCollectionViewController(collectionViewLayout: collectionViewFlowStock)
        let navigationStock = UINavigationController(rootViewController: collectionViewControllerStock)
        navigationStock.tabBarItem.image = UIImage(named: "Group")?.withRenderingMode(.alwaysTemplate)
        navigationStock.tabBarItem.title = "Акции"
        navigationStock.tabBarItem.tag  = 1
        
        //MARK: - profile controller
        let profileViewController = ProfileViewController()
        let navigationProfile = UINavigationController(rootViewController: profileViewController)
        navigationProfile.tabBarItem.tag = 2
        navigationProfile.tabBarItem.title = "Профиль"
        navigationProfile.tabBarItem.image = UIImage(named: "Vector")?.withRenderingMode(.alwaysTemplate)
        
        //MARK: - contact controller
        let contactController = ContactsViewController()
        let navigationContact = UINavigationController(rootViewController: contactController)
        navigationContact.tabBarItem.image = UIImage(named: "customer-service")?.withRenderingMode(.alwaysTemplate)
        navigationContact.tabBarItem.title = "Контакты"
        navigationContact.tabBarItem.tag = 3
        
        //MARK: - add to tabbar
        viewControllers = [navigationMenu,navigationStock,navigationProfile,navigationContact]
        
    }
 }

extension TabBarControllerMenu:UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        // В принципе можно и было решить через IfElse было бы меньше кода , просто проверял бы item.tag = 0 && 1, а в остальных случаях было бы произведение item.tag*10.0 где 10.0 - означает угол закгругление tabBar.layer.cornerRadius
        // я просто хотел что нибудь такое, другое, придумать , поэтому оставил так.
        var coordinate = CGRect.zero
        
        switch item.tag {
        case 0:
            coordinate = CGRect(x: 10.0, y: 0.0, width: self.tabScrollView.frame.width, height: 2.0)
        case 1:
            coordinate = CGRect(x: self.tabScrollView.frame.width*CGFloat(item.tag)+10.0, y: 0.0, width: self.tabScrollView.frame.width, height: 2.0)
        case 2:
            coordinate = CGRect(x: self.tabScrollView.frame.width*CGFloat(item.tag)+10.0*CGFloat(item.tag), y: 0.0, width: self.tabScrollView.frame.width, height: 2.0)
        case 3:
            coordinate = CGRect(x: self.tabScrollView.frame.width*CGFloat(item.tag)+10.0*CGFloat(item.tag), y: 0.0, width: self.tabScrollView.frame.width, height: 2.0)
        default:
            print("default tapped")
        }
        UIView.animate(withDuration: 0.3) { [weak object = self] in
            object?.tabScrollView.frame = coordinate
        }
   }
}
