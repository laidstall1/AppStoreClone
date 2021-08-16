//
//  AppsHeaderCell.swift
//  AppStoreClone
//
//  Created by mac on 15/08/2021.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        appHeaderHorizontalController.view.backgroundColor = .systemYellow
        
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
