//
//  StockCollectionViewCell.swift
//  bambook
//
//  Created by Admin on 18/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

// this is cell used when we has data
import UIKit

class StockCollectionViewCell: UICollectionViewCell {
    
    var stockTitle:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.text = "stock title"
        view.font = UIFont.robotoBold13()
        view.textColor = UIColor(red: 0.8, green: 0.56, blue: 0.08, alpha: 1.0)
        view.adjustsFontSizeToFitWidth = true
       return view
    }()
    
    var stockImage:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = UIColor.clear
       return view
    }()
    
    var stockDiscountTitle:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.adjustsFontSizeToFitWidth = true
        view.text = "stock discount"
        view.textColor = UIColor.white
        view.font = UIFont.robotoBold13()
        view.textAlignment = .center
       return view
    }()
    
    var stockLimit:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.adjustsFontSizeToFitWidth = true
        view.text = "stock limit"
        view.textAlignment = .center
        view.textColor = UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1.0)
        view.font = UIFont.robotoBold13()
       return view
    }()
    
    var itemData:Stocks? {
        didSet{
            guard let dataTitle = itemData?.title else {return}
            self.stockTitle.text = dataTitle
            guard let dataImage = itemData?.image else {return}
            self.stockImage.kf.setImage(with: URL(string: dataImage))
            guard let dataDiscount = itemData?.subTitle else {return}
            self.stockDiscountTitle.text = dataDiscount
            guard let limit = itemData?.end_data else {return}
            self.stockLimit.text = limit
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.cornerRadius = 20.0
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = UIColor(red: 0.04, green: 0.11, blue: 0.2, alpha: 1.0)
        self.allSubViewsAdd()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.allConstraints()
    }
    
    //MARK: - add all subViews
    private func allSubViewsAdd() {
        addSubview(self.stockTitle)
        addSubview(self.stockImage)
        addSubview(self.stockDiscountTitle)
        addSubview(self.stockLimit)
    }
    
    private func allConstraints() {
        //MARK: - stockTitle constraint
        self.stockTitle.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: stockImage.topAnchor, padding: .init(top: 16.0, left: 16.0, bottom: -16.0, right: -16.0), size: .zero)
        
        //MARK: - stockImage constraint
        self.stockImage.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor, padding: .init(top: 46, left: 0.0, bottom: -46.0, right: 0.0), size: .zero)
        
        //MARK: - stockDiscountTitle constraint
        self.stockDiscountTitle.anchor(top: stockImage.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: stockLimit.topAnchor, padding: .init(top: 16.0, left: 16.0, bottom: 16.0, right: -16.0), size: .zero)
        
        //MARK: - stockLimit constraint
        self.stockLimit.anchor(top: stockDiscountTitle.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor, padding: .init(top: 16.0, left: 16.0, bottom: 16.0, right: -16.0), size: .zero)
    }
}
