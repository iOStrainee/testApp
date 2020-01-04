//
//  DetailDishViewController.swift
//  bambook
//
//  Created by Admin on 29/12/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DetailDishViewController: UIViewController {
    var navbar:UINavigationBar = UINavigationBar()
    var tabbarheight:UITabBar = UITabBar()
    
    var nameOfDish:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor.white
        view.text = "название блюда"
        view.adjustsFontSizeToFitWidth = true
        view.font = UIFont.appetite24()
        view.numberOfLines = 0
        view.textAlignment = .center
       return view
    }()
    var dishImage:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = UIColor.green
        return view
    }()
    var detailDescriptionDish:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1.0)
        view.adjustsFontSizeToFitWidth = true
        view.numberOfLines = 0
        view.text = "Детальное описание блюда"
        view.font = UIFont.roboto13()
        view.textAlignment = .center
        return view
    }()
    var weightDish:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Порция: "
        view.textColor = UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1.0)
        view.font = UIFont.roboto13()
        view.numberOfLines = 2
        view.textAlignment = .center
        view.adjustsFontSizeToFitWidth = true
       return view
    }()
    var priceDish:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.adjustsFontSizeToFitWidth = true
        view.numberOfLines = 1
        view.textAlignment = .center
        view.text = "ценаааа"
        view.font = UIFont.appetite24()
        view.textColor = UIColor.yellow.withAlphaComponent(0.25)
       return view
    }()
    var countLabel:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "количество"
        view.numberOfLines = 1
        view.textAlignment = .center
        view.adjustsFontSizeToFitWidth = true
        view.textColor = UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1.0)
        view.font = UIFont.roboto13()
       return view
    }()
    var minusDish:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.9, green: 0.49, blue: 0.9, alpha: 1.0)
        view.layer.cornerRadius = view.frame.height/2.0
        view.layer.masksToBounds = true
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 4.0
       return view
    }()
    var plusDish:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.9, green: 0.49, blue: 0.9, alpha: 1.0)
        view.layer.cornerRadius = view.frame.height/2.0
        view.layer.masksToBounds = true
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 4.0
       return view
    }()
    
    var cartButton:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.green
        view.layer.masksToBounds = true
        view.layer.cornerRadius = view.frame.height/2.0
        view.setTitle("добавить", for: .normal)
       return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.
        
        if let nav = self.navigationController?.navigationBar {
            self.navbar = nav
        }
        if let tabBar = self.tabBarController?.tabBar{
            self.tabbarheight = tabBar
        }
        self.view.backgroundColor = UIColor.mainColor()
        self.allSubViews()
    }
    
    private func allSubViews(){
        self.view.addSubview(self.nameOfDish)
        self.view.addSubview(self.dishImage)
        self.view.addSubview(self.detailDescriptionDish)
        self.view.addSubview(self.weightDish)
        self.view.addSubview(self.priceDish)
        self.view.addSubview(self.countLabel)
        self.view.addSubview(self.minusDish)
        self.view.addSubview(self.plusDish)
        self.view.addSubview(self.cartButton)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        DispatchQueue.main.async {
            self.constraintAllView()
        }
    }
    
    private func constraintAllView() {
        
        // nameOfDish
        self.nameOfDish.topAnchor.constraint(equalTo: self.navbar.bottomAnchor, constant: 10.0).isActive = true
        self.nameOfDish.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10.0).isActive = true
        self.nameOfDish.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10.0).isActive = true
        
        // dishImage
        self.dishImage.topAnchor.constraint(equalTo: self.nameOfDish.bottomAnchor, constant: 5.0).isActive = true
        self.dishImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50.0).isActive = true
        self.dishImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50.0).isActive = true
        self.dishImage.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/3).isActive = true
        
        // detailDescription
        self.detailDescriptionDish.topAnchor.constraint(equalTo: self.dishImage.bottomAnchor, constant: 10.0).isActive = true
        self.detailDescriptionDish.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10.0).isActive = true
        self.detailDescriptionDish.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10.0).isActive = true
      
        // weightDish
        self.weightDish.topAnchor.constraint(equalTo: self.detailDescriptionDish.bottomAnchor, constant: 5.0).isActive = true
        self.weightDish.centerXAnchor.constraint(equalTo: self.detailDescriptionDish.centerXAnchor).isActive = true
        
        // priceDish
        self.priceDish.topAnchor.constraint(equalTo: self.weightDish.bottomAnchor, constant: 20.0).isActive = true
        self.priceDish.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // minus , plus and count label
        self.countLabel.topAnchor.constraint(equalTo: self.priceDish.bottomAnchor, constant: 20.0).isActive = true
        self.countLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.minusDish.centerYAnchor.constraint(equalTo: self.countLabel.centerYAnchor).isActive = true
        self.minusDish.trailingAnchor.constraint(equalTo: self.countLabel.leadingAnchor).isActive = true
        self.minusDish.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/10).isActive = true
        self.minusDish.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/10).isActive = true
        
        self.plusDish.centerYAnchor.constraint(equalTo: self.countLabel.centerYAnchor).isActive = true
        self.plusDish.leadingAnchor.constraint(equalTo: self.countLabel.trailingAnchor).isActive = true
        self.plusDish.heightAnchor.constraint(equalTo: self.minusDish.heightAnchor).isActive = true
        self.plusDish.widthAnchor.constraint(equalTo: self.minusDish.widthAnchor).isActive = true
        
        self.minusDish.layer.cornerRadius = self.minusDish.frame.height/2.0
        self.plusDish.layer.cornerRadius = self.plusDish.frame.height/2.0
        
        self.cartButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.cartButton.bottomAnchor.constraint(equalTo: self.tabbarheight.topAnchor, constant: -5.0).isActive = true
        self.cartButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/8).isActive = true
        self.cartButton.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/8).isActive = true
        self.cartButton.layer.cornerRadius = self.cartButton.frame.height/2.0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
