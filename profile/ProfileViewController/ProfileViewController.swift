//
//  ProfileViewController.swift
//  bambook
//
//  Created by Admin on 23/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingsNavigationBar() // here we configure background color, title text and him fonts
        self.createNavigationItems() // here we create left and right bar button
        self.allSubViews()
        
    }
    
    //MARK: - add textField types to stackOfTextField
    private func allSubViews() {
        
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
    
    //MARK: - settings navigationBar
    private func settingsNavigationBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.appetite24()]
        self.navigationController?.navigationBar.barTintColor = UIColor.mainColor()
        self.navigationItem.title = "Профиль"
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
}
