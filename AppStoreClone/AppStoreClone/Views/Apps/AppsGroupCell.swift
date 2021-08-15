//
//  AppsGroupCell.swift
//  AppStoreClone
//
//  Created by mac on 14/08/2021.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    private let titleLabel = CustomLabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
    private let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .systemPink
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
