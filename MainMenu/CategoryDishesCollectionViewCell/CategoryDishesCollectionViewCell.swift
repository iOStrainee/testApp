//
//  CategoryDishesCollectionViewCell.swift
//  bambook
//
//  Created by Admin on 03.10.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryDishesCollectionViewCell: UICollectionViewCell {
    var item:CategoryDishModel! {
        didSet{
            nameOfCategory.text = item.name
            imageObject.kf.setImage(with: URL(string: item.image)!)
        }
    }
    
    var nameOfCategory:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1.0)
        view.textAlignment = .center
        view.font = UIFont.roboto13()
        view.lineBreakMode = .byCharWrapping
        view.adjustsFontSizeToFitWidth = true
       return view
    }()
    
    var imageObject:UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.roundedMainLayer()
        self.autoLayoutImageAndLabel()
    }
    
    //MARK: - rounded corner radius and set color
    func roundedMainLayer() {
        self.contentView.layer.cornerRadius = 20.0
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = UIColor(red: 0.04, green: 0.11, blue: 0.2, alpha: 1.0)
    }
    
    // MARK: - layout for image and label
    func autoLayoutImageAndLabel() {
        
        // property -- imageObject UIImageVew
        self.contentView.addSubview(imageObject)
        self.imageObject.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16.0).isActive = true
        self.imageObject.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16.0).isActive = true
        self.imageObject.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16.0).isActive = true
        self.imageObject.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -63.0).isActive = true
        
        // property -- nameOfCategory UILabel
        self.contentView.addSubview(nameOfCategory)
        self.nameOfCategory.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16.0).isActive = true
        self.nameOfCategory.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16.0).isActive = true
        self.nameOfCategory.topAnchor.constraint(equalTo: self.imageObject.bottomAnchor, constant: -23.0).isActive = true
        self.nameOfCategory.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -23.0).isActive = true
    }
}
