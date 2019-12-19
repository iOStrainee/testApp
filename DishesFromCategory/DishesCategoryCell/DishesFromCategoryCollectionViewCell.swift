//
//  DishesFromCategoryCollectionViewCell.swift
//  bambook
//
//  Created by Admin on 04.10.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DishesFromCategoryCollectionViewCell: UICollectionViewCell {
    var itemData:Dishes? {
        didSet {
            guard let name = itemData?.name else {return}
            nameOfDishes.text = name
            guard let price = itemData?.price else {return}
            priceLabel.text = price
            guard let image = itemData?.photo else {return}
            imageObject.kf.setImage(with: URL(string: image))
        }
    }
    
    var nameOfDishes:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.text = "test text text text test test test test"
        view.textColor = UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1.0)
        view.textAlignment = .center
        view.font = UIFont.roboto13()
        view.lineBreakMode = .byCharWrapping
        return view
    }()
    
    var priceLabel:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = " сом"
        view.textColor = UIColor(red: 0.8, green: 0.56, blue: 0.08, alpha: 1.0)
        view.textAlignment = .center
        view.font = UIFont.roboto13()
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        return view
    }()
    
    var imageObject:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds  = true
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    var cartButton:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("в корзину", for: .normal)
        view.titleLabel?.font = UIFont.roboto13()
        view.titleLabel?.textColor = UIColor.black
        view.titleLabel?.textAlignment = .center
        view.backgroundColor = UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1.0)
        view.layer.cornerRadius = 20.0
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addViews()
        self.mainLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.constraintProperties()
    }
    
    //MARK: - configure main layer background color and corner radius
    func mainLayer() {
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 20.0
        self.contentView.backgroundColor = UIColor(red: 0.04, green: 0.11, blue: 0.2, alpha: 1.0)
    }
    //MARK: - add all sub views
    private func addViews() {
        self.contentView.addSubview(nameOfDishes)
        self.contentView.addSubview(imageObject)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(cartButton)
    }
    
    //MARK: - constraints for all properties
    private func constraintProperties() {
        // property of nameOfDishes
        self.nameOfDishes.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: imageObject.topAnchor, padding: .init(top: 16.0, left: 16.0, bottom: -8.0, right: -16.0), size: .zero)
        
        // property of imageObject
       self.imageObject.anchor(top: nameOfDishes.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: self.priceLabel.topAnchor, padding: .init(top: 8.0, left: 16.0, bottom: 5.0, right: -16.0), size: .zero)
        
        // property of priceLabel
        self.priceLabel.anchor(top: imageObject.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: cartButton.topAnchor, padding: .init(top: 8.0, left: 16.0, bottom: -8.0, right: -16.0), size: .zero)
        
        //property of cartButton
        self.cartButton.anchor(top: nil, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor, padding: .init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0), size: .init(width: contentView.bounds.width, height: 40.0))
    }
}
