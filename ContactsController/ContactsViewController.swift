//
//  ContactsViewController.swift
//  bambook
//
//  Created by Admin on 08/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    var scrollView:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
       return view
    }()
    
    var contactViewModel:ContactsViewModel!
    
    var titleLabel:UILabel = {
        let view = UILabel()
        view.text = "Контакты"
        view.adjustsFontSizeToFitWidth = true
        view.font = UIFont.appetite24()
        view.textColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
        view.sizeToFit()
       return view
    }()
    
    var numberAndContact:UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.text = "Контактные телефоны:\n0 312 88 00 58, 0 708 88 88 44, 0 772 88 88 44"
        view.textAlignment = .center
        view.adjustsFontSizeToFitWidth = true
        view.sizeToFit()
        view.textColor = UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1.0)
        view.font = UIFont.robotoBold13()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        view.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        view.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
       return view
    }()
    
    var leftRectangle:UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0.0, y: 0.0, width: 74.0, height: 2.0)
        view.backgroundColor = UIColor.colorRectangle()
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    var rightRectangle:UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0.0, y: 0.0, width: 74.0, height: 2.0)
        view.backgroundColor = UIColor.colorRectangle()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var facebookButton:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel?.textColor = UIColor.black
        view.setTitle("/foodbambook", for: .normal)
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.sizeToFit()
        view.imageEdgeInsets = UIEdgeInsets(top: 8.0, left: 22.0, bottom: 8.0, right: 14.0)
        view.backgroundColor = UIColor(red: 0.23, green: 0.35, blue: 0.6, alpha: 1.0)
        view.layer.cornerRadius = 20.0
        view.layer.masksToBounds = true
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 4.0
        view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
       return view
    }()
    
    var instagramButton:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel?.textColor = UIColor.black
        view.setTitle("@bambook_kg", for: .normal)
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.sizeToFit()
        view.backgroundColor = UIColor(red: 0.9, green: 0.49, blue: 0.9, alpha: 1.0)
        view.imageEdgeInsets = UIEdgeInsets(top: 8.0, left: 22.0, bottom: 8.0, right: 14.0)
        view.layer.cornerRadius = 20.0
        view.layer.masksToBounds = true
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 4.0
        view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
       return view
    }()
    
    var imageMap:UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
       return view
    }()
    
    var labelStack1:UILabel = {
        let view = UILabel()
        view.text = "Бесплатная доставка при заказе от 400 сом"
        view.adjustsFontSizeToFitWidth = true
        view.sizeToFit()
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor.init(red: 0.8, green: 0.56, blue: 0.08, alpha: 1.0)
       return view
    }()
    
    var labelStack2:UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.text = ""
        view.adjustsFontSizeToFitWidth = true
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor.init(red: 0.36, green: 0.47, blue: 0.6, alpha: 1.0)
       return view
    }()
    
    var stackVertical:UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .equalCentering
        view.spacing = 3.0
        view.alignment = .center
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        self.allViews()
        self.contactViewModel = ContactsViewModel(delegate: self)
    }
    
    override func viewWillLayoutSubviews() {
        self.forAllProperties()
    }
    
    //MARK: - add views as subviews
    private func allViews() {
        view.addSubview(self.titleLabel)
        view.addSubview(self.leftRectangle)
        view.addSubview(self.rightRectangle)
        view.addSubview(self.numberAndContact)
        view.addSubview(self.imageMap)
        view.addSubview(self.facebookButton)
        view.addSubview(self.instagramButton)
        view.addSubview(self.stackVertical)
    }
    
    //MARK: - autolayout properties
    func forAllProperties() {
        //MARK: - title contact
        self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5.0).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.titleLabel.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/9.0).isActive = true
        self.titleLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/3.0).isActive = true
        
        //MARK: - left rectangle
        self.leftRectangle.trailingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: -2.0).isActive = true
        self.leftRectangle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.leftRectangle.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        self.leftRectangle.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
        
        //MARK: - right rectangle
        self.rightRectangle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.rightRectangle.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: -2.0).isActive = true
        self.rightRectangle.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        self.rightRectangle.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
        
        //MARK: - number and contact
        self.numberAndContact.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5.0).isActive = true
        self.numberAndContact.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.numberAndContact.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        self.numberAndContact.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/9.0).isActive = true
        
        guard let tabBarTopAnchor = tabBarController?.tabBar.topAnchor else {
            print("height")
            return
        }
        
        //MARK: - facebook button
        self.facebookButton.anchor(top: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: tabBarTopAnchor, padding: .init(top: 0.0, left: 16.0, bottom: -16.0, right: -188.0), size: .init(width: 0.0, height: 40.0))
        
        //MARK: - instagram button
        self.instagramButton.anchor(top: nil, leading: nil, trailing: view.trailingAnchor, bottom: tabBarTopAnchor, padding: .init(top: 0.0, left: 0.0, bottom: -16.0, right: -16.0), size: .zero)
        self.instagramButton.anchorEqualSize(toView: self.facebookButton)
        
        //MARK: - imageMap
        self.imageMap.anchor(top: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: facebookButton.topAnchor, padding: .init(top: 0.0, left: 16.0, bottom: -72.0, right: -16.0), size: .zero)
        let topImage = self.imageMap.topAnchor.constraint(equalTo: self.numberAndContact.bottomAnchor, constant: 17.0)
        topImage.priority = UILayoutPriority(999)
        topImage.isActive = true
        
        //MARK: - stackVerticalView
        self.stackVertical.addArrangedSubview(self.labelStack1)
        self.stackVertical.addArrangedSubview(self.labelStack2)
        self.stackVertical.anchor(top: imageMap.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: facebookButton.topAnchor, padding: .init(top: 16.0, left: 43.0, bottom: -16.0, right: -43.0), size: .zero)
    }
}

//MARK: - conform to ViewModelDelegate
extension ContactsViewController: ViewModelDelegate {
    func willLoadAnimation() {
        print("will load animation contact")
    }
    
    func didLoadAnimation() {
        print("did load animation contact")
        guard let dataImage = contactViewModel.contacts?.map_image else {
            print("error retrieve data contacts")
            return
        }
        self.imageMap.kf.setImage(with: URL(string: dataImage))
        
        guard let start = contactViewModel.contacts?.work_start, let end = contactViewModel.contacts?.work_end else {
            print("error retrieve data schedule contact ")
            return
        }
        
        self.labelStack2.text = start+" "+end
    }
    
    func hasError() {
        print("has error contact")
    }
}
