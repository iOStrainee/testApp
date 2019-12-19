//
//  CollectionViewCell.swift
//  bambook
//
//  Created by Admin on 12/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    var slider:Slider? {
        didSet {
            guard let image = slider?.image else {
                print("error retrieve data from model slider")
                return
            }
            imageObject.kf.setImage(with: URL(string: image))
        }
    }
    var imageObject:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        //MARK: - image view object
        addSubview(imageObject)
        self.imageObject.backgroundColor = UIColor.purple
        self.imageObject.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.imageObject.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.imageObject.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.imageObject.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
