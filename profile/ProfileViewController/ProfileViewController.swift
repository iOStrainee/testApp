//
//  ProfileViewController.swift
//  bambook
//
//  Created by Admin on 23/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var navBar:UINavigationBar = UINavigationBar()
    
    //MARK: - name of view controller
    var titleViewController:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Профиль"
        view.adjustsFontSizeToFitWidth = true
        view.textColor = UIColor.white
        view.font = UIFont.appetite24()
        return view
    }()
    
    //MARK: - left and right view that will be whith straight line yellow color
    var leftView:UIView = {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 74.0, height: 2.0))
        view.backgroundColor = UIColor.colorRectangle()
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    var rightView:UIView = {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 74.0, height: 2.0))
        view.backgroundColor = UIColor.colorRectangle()
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    //MARK: - uitextField properties for stackOflabel
    var nameTextField:UITextField = {
       let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholderColorChange(requiredPlaceholderString: "имя")
        view.adjustsFontSizeToFitWidth = true
        view.backgroundColor = UIColor.mainColor()
        view.layer.cornerRadius = 20.0
        view.textColor = UIColor.colorTextField()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.colorBorderTextField()
        view.moveContent()
        return view
    }()
    var phoneNumberTextField:UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.adjustsFontSizeToFitWidth = true
        view.backgroundColor = UIColor.mainColor()
        view.placeholderColorChange(requiredPlaceholderString: "номер телефона")
        view.layer.cornerRadius = 20.0
        view.textColor = UIColor.colorTextField()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.colorBorderTextField()
        view.moveContent()
        return view
    }()
    var streetTextField:UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.adjustsFontSizeToFitWidth = true
        view.backgroundColor = UIColor.mainColor()
        view.layer.cornerRadius = 20.0
        view.placeholderColorChange(requiredPlaceholderString: "название улицы")
        view.textColor = UIColor.colorTextField()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.colorBorderTextField()
        view.moveContent()
        return view
    }()
    var homeTextField:UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.adjustsFontSizeToFitWidth = true
        view.backgroundColor = UIColor.mainColor()
        view.placeholderColorChange(requiredPlaceholderString: "номер дома")
        view.layer.cornerRadius = 20.0
        view.textColor = UIColor.colorTextField()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.colorBorderTextField()
        view.moveContent()
        return view
    }()
    var apartmentTextField:UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.adjustsFontSizeToFitWidth = true
        view.backgroundColor = UIColor.mainColor()
        view.placeholderColorChange(requiredPlaceholderString: "номер квартиры")
        view.layer.cornerRadius = 20.0
        view.textColor = UIColor.colorTextField()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.colorBorderTextField()
        view.moveContent()
        return view
    }()
    var passwordTextField:UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.adjustsFontSizeToFitWidth = true
        view.isSecureTextEntry = true
        view.backgroundColor = UIColor.mainColor()
        view.placeholderColorChange(requiredPlaceholderString: "пароль")
        view.layer.cornerRadius = 20.0
        view.textColor = UIColor.colorTextField()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.colorBorderTextField()
        view.moveContent()
        return view
    }()
    var stackOfTextField:UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 20.0
        return view
    }()
    
    //MARK: - save button
    var saveButton:UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("сохранить", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.setTitleColor(UIColor.green.withAlphaComponent(0.2), for: .highlighted)
        view.titleLabel?.textAlignment = .center
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.layer.cornerRadius = 20.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.colorBorderTextField()
        return view
    }()
    
    //MARK: - history button
    var historyButton:UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor.mainColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("история заказов", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.titleLabel?.textAlignment = .center
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.layer.cornerRadius = 20.0
        view.layer.borderColor = UIColor.colorBorderTextField()
        view.layer.borderWidth = 1.0
        return view
    }()
    
    //MARK: - define scroll view properties
    var scrollView:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.mainColor()
        view.isScrollEnabled = true
        return view
    }()
    
    //MARK: - uiview for scrollview
    var scrollContentView:UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.mainColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var navSubView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.mainColor()
//        self.navigationController?.navigationBar.topItem?.title = "Профиль"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        if let temp = self.navigationController?.navigationBar {
            self.navBar = temp
            self.navSubView.bounds.size = temp.bounds.size
        }
        
        self.allSubViews()
        
    }
    
    //MARK: - add textField types to stackOfTextField
    private func allSubViews() {
        self.navBar.addSubview(self.navSubView)
        self.navSubView.addSubview(self.titleViewController)
        self.navSubView.addSubview(self.leftView)
        self.navSubView.addSubview(self.rightView)
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.scrollContentView)
        self.scrollContentView.addSubview(self.stackOfTextField)
        
        self.stackOfTextField.addArrangedSubview(nameTextField)
        self.stackOfTextField.addArrangedSubview(phoneNumberTextField)
        self.stackOfTextField.addArrangedSubview(streetTextField)
        self.stackOfTextField.addArrangedSubview(homeTextField)
        self.stackOfTextField.addArrangedSubview(apartmentTextField)
        self.stackOfTextField.addArrangedSubview(passwordTextField)
        self.stackOfTextField.addArrangedSubview(saveButton)
        self.stackOfTextField.addArrangedSubview(historyButton)
    }
    
    //MARK: - here we override layout method for scrollview, scrollcontentView and stackTextField
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // constraint for subview of navbar
        self.navSubView.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor).isActive = true
        self.navSubView.topAnchor.constraint(equalTo: self.navBar.topAnchor).isActive = true
        self.navSubView.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor).isActive = true
        self.navSubView.bottomAnchor.constraint(equalTo: self.navBar.bottomAnchor).isActive = true
        self.navSubView.widthAnchor.constraint(equalTo: self.navBar.widthAnchor).isActive = true
        self.navSubView.heightAnchor.constraint(equalTo: self.navBar.heightAnchor).isActive = true
        
        //constraint for titleViewController
        self.titleViewController.centerYAnchor.constraint(equalTo: self.navSubView.centerYAnchor).isActive = true
        self.titleViewController.centerXAnchor.constraint(equalTo: self.navSubView.centerXAnchor).isActive = true
        self.titleViewController.widthAnchor.constraint(equalTo: self.navSubView.widthAnchor, multiplier: 1/3).isActive = true
        self.titleViewController.heightAnchor.constraint(equalTo: self.navSubView.heightAnchor, multiplier: 1/2).isActive = true
        
        // constraint for subview of testView
        self.leftView.leadingAnchor.constraint(equalTo: self.navSubView.leadingAnchor, constant: 5.0).isActive = true
        self.leftView.trailingAnchor.constraint(equalTo: self.titleViewController.leadingAnchor, constant: -5.0).isActive = true
        self.leftView.centerYAnchor.constraint(equalTo: self.titleViewController.centerYAnchor).isActive = true
        self.leftView.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
        
        // constraint for subview of testView
        self.rightView.leadingAnchor.constraint(equalTo: self.titleViewController.trailingAnchor, constant: 5.0).isActive = true
        self.rightView.trailingAnchor.constraint(equalTo: self.navSubView.trailingAnchor, constant: -5.0).isActive = true
        self.rightView.centerYAnchor.constraint(equalTo: self.titleViewController.centerYAnchor).isActive = true
        self.rightView.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
        
        // MARK: - scrollview constraints
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10.0).isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 1000.0)
        
        //MARK: - scrollContentView
        self.scrollContentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.scrollContentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.scrollContentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.scrollContentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1.0).isActive = true
        self.scrollContentView.heightAnchor.constraint(equalToConstant: self.scrollView.contentSize.height).isActive = true
        
        //MARK: - stackTextField
        self.stackOfTextField.topAnchor.constraint(equalTo: self.scrollContentView.topAnchor, constant: 30.0).isActive = true
        self.stackOfTextField.leadingAnchor.constraint(equalTo: self.scrollContentView.leadingAnchor, constant: 10.0).isActive = true
        self.stackOfTextField.trailingAnchor.constraint(equalTo: self.scrollContentView.trailingAnchor, constant: -10.0).isActive = true
        self.stackOfTextField.heightAnchor.constraint(equalTo: self.scrollContentView.heightAnchor, multiplier: 0.5).isActive = true
    }
}
