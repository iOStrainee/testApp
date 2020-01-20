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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: - layout sub view
    override func layoutSubviews() {
        
    }
}
