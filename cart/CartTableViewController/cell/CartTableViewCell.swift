//
//  CartTableViewCell.swift
//  bambook
//
//  Created by Admin on 20/01/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    //MARK: - UI properties
    var name:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.appetite24()
        view.textColor = UIColor.white
        view.adjustsFontSizeToFitWidth = true
        view.textAlignment = .center
       return view
    }()
    
    var price:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.appetite24()
        view.textColor = UIColor.white
        view.adjustsFontSizeToFitWidth = true
        view.textAlignment = .center
        return view
    }()
    
    var imageFood:UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    var stackVerticalDirection:UIStackView = {
       let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10.0
        view.alignment = .center
        view.distribution = .fillEqually
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.mainColor()
        self.allSubView() // add subviews
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: - layout sub view
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutAllViews()
    }
    
    //MARK: - add all subview
    private func allSubView() {
        self.addSubview(self.imageFood)
        self.addSubview(self.stackVerticalDirection)
        self.stackVerticalDirection.addArrangedSubview(self.name)
        self.stackVerticalDirection.addArrangedSubview(self.price)
    }
    
    //MARK: - layouts all subview
    private func layoutAllViews(){
        
        // property imageFood
        self.imageFood.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0).isActive = true
        self.imageFood.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0).isActive = true
        self.imageFood.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5.0).isActive = true
        self.imageFood.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10.0).isActive = true
        self.imageFood.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0/4.0, constant: -5.0).isActive = true
        
        // stack constraints
        self.stackVerticalDirection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0).isActive = true
        self.stackVerticalDirection.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0).isActive = true
        self.stackVerticalDirection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0).isActive = true
        self.stackVerticalDirection.bottomAnchor.constraint(equalTo: self.imageFood.bottomAnchor).isActive = true
    }
}
