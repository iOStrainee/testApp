//
//  HeaderCollectionReusableView.swift
//  bambook
//
//  Created by Admin on 09/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

//MARK: - cell identifier
let cellSlider = "cellSlider"

class HeaderCollectionReusableView: UICollectionReusableView {
    var sliderViewModel:SliderViewModel!
    
    var inSideCollectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    var searchBar:UISearchBar = {
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.04, green: 0.11, blue: 0.2, alpha: 1.0)
       return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.insideCollectionConfigure()
        self.sliderViewModel = SliderViewModel(delegate: self)
        self.settingSearchBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        self.autolayoutProperties()
        
        self.addSubview(self.searchBar)
        self.bringSubviewToFront(self.searchBar)
        self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.searchBar.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/6).isActive = true
    }
    
    //MARK: - collectionView configure
    private func insideCollectionConfigure(){
        self.inSideCollectionView.delegate = self
        self.inSideCollectionView.dataSource = self
        self.inSideCollectionView.register(SliderCollectionViewCell.self, forCellWithReuseIdentifier: cellSlider)
        self.inSideCollectionView.showsHorizontalScrollIndicator = false
    }
    
    //MARK: - autolayout for all properties
    private func autolayoutProperties() {
        //MARK: - configure constraint collectionView
        self.addSubview(inSideCollectionView)
        self.inSideCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.inSideCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.inSideCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.inSideCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    //MARK: - setting UISeachBar
    private func settingSearchBar() {
        self.searchBar.placeholder = "поиск блюда"
        self.searchBar.barTintColor = UIColor.mainColor()
        self.searchBar.barStyle = .black
        self.searchBar.showsCancelButton = true
        self.searchBar.setShowsCancelButton(true, animated: true)
        if let searchText = self.searchBar.value(forKey: "cancelButton") as? UIButton {
            print("horaaay  = \(searchText.titleLabel?.text)")
        }
    }
}

//MARK: - UICollectionViewFlowLayout delegate , here we setting cell size and space items etc
extension HeaderCollectionReusableView :UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width, height: self.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

//MARK: - data source
extension HeaderCollectionReusableView:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sliderViewModel.countRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellSlider, for: indexPath) as? SliderCollectionViewCell else {return UICollectionViewCell()}
        cell.slider = sliderViewModel.sliderItems[indexPath.row]
        return cell
    }
}

//MARK: - conform delegate 
extension HeaderCollectionReusableView:ViewModelDelegate {
    func willLoadAnimation() {
        print("will load animation HeaderColectionReusableView")
    }
    
    func didLoadAnimation() {
        print("did load animation HeaderCollectionReusableView")
        inSideCollectionView.reloadData()
    }
    
    func hasError() {
        print("has error on header HeaderCollectionReusableView")
    }
}
