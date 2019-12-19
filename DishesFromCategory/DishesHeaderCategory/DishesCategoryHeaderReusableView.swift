//
//  DishesCategoryHeaderReusableView.swift
//  bambook
//
//  Created by Admin on 28/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DishesCategoryHeaderReusableView: UICollectionReusableView {
 
    var imageView:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
       return view
    }()
    
    var sizeImage = CGSize(width: 100.0, height: 100.0)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black
        self.addSubview(imageView)
        print(#function)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.constraint()
        print("add sub view is called in header")
    }
    
    //MARK: - contraints for imageView
    private func constraint() {
        self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: sizeImage.width).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: sizeImage.height).isActive = true
    }
}
