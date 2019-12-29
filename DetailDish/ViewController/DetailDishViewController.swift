//
//  DetailDishViewController.swift
//  bambook
//
//  Created by Admin on 29/12/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DetailDishViewController: UIViewController {

    var searchBar:UISearchBar = {
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "поиск блюд"
        view.barTintColor = UIColor.mainColor()
        view.tintColor = UIColor.mainColor()
        view.textFieldComputed.tintColor = UIColor.red
        view.textFieldComputed.backgroundColor = UIColor.green
        return view
    }()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.mainColor()
        self.allSubViews()
    }
    
    private func allSubViews(){
        self.view.addSubview(self.searchBar)
        self.view.addSubview(self.nameOfDish)
        self.view.addSubview(self.dishImage)
        self.view.addSubview(self.detailDescriptionDish)
        self.view.addSubview(self.weightDish)
        self.view.addSubview(self.priceDish)
        self.view.addSubview(self.countLabel)
        self.view.addSubview(self.minusDish)
        self.view.addSubview(self.plusDish)
    }

    override func viewWillLayoutSubviews() {
        self.constraintAllView()
        super.viewWillLayoutSubviews()
    }
    
    private func constraintAllView() {
        //MARK: - search bar
        self.searchBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20.0).isActive = true
        self.searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10.0).isActive = true
        self.searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10.0).isActive = true
        //MARK: - name of dish
        self.nameOfDish.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 10.0).isActive = true
        self.nameOfDish.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0).isActive = true
        //MARK: - dish image
        self.dishImage.topAnchor.constraint(equalTo: self.nameOfDish.bottomAnchor, constant: 10.0).isActive = true
        self.dishImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.dishImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50.0).isActive = true
        self.dishImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50.0).isActive = true
        self.dishImage.bottomAnchor.constraint(equalTo: self.detailDescriptionDish.topAnchor, constant: -10.0).isActive = true
        //MARK: - detail description
        self.detailDescriptionDish.topAnchor.constraint(equalTo: self.dishImage.bottomAnchor, constant: 50.0).isActive = true
        self.detailDescriptionDish.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10.0).isActive = true
        self.detailDescriptionDish.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10.0).isActive = true
        self.detailDescriptionDish.bottomAnchor.constraint(equalTo: self.weightDish.topAnchor, constant: -5.0).isActive = true
        //MARK: - weight dish
        self.weightDish.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.weightDish.topAnchor.constraint(equalTo: self.detailDescriptionDish.bottomAnchor, constant: 5.0).isActive = true
        self.weightDish.bottomAnchor.constraint(equalTo: self.priceDish.topAnchor, constant: -50.0).isActive = true
        //MARK: - price dish
        self.priceDish.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.priceDish.topAnchor.constraint(equalTo: self.weightDish.bottomAnchor, constant: 50.0).isActive = true
        self.priceDish.bottomAnchor.constraint(equalTo: self.countLabel.topAnchor, constant: -50.0).isActive = true
        //MARK: - count
        self.countLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.countLabel.topAnchor.constraint(equalTo: self.priceDish.bottomAnchor, constant: 50.0).isActive = true
        //MARK: - minus and plus
        self.minusDish.trailingAnchor.constraint(equalTo: self.countLabel.leadingAnchor, constant: -10.0).isActive = true
        self.minusDish.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/6).isActive = true
        self.minusDish.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/6).isActive = true
        self.plusDish.leadingAnchor.constraint(equalTo: self.countLabel.trailingAnchor, constant: 10.0).isActive = true
        self.minusDish.topAnchor.constraint(equalTo: self.countLabel.topAnchor).isActive = true
        self.plusDish.topAnchor.constraint(equalTo: self.countLabel.topAnchor).isActive = true
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
