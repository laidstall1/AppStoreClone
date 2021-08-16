//
//  AppHeaderRowCell.swift
//  AppStoreClone
//
//  Created by mac on 15/08/2021.
//

import UIKit

class AppHeaderRowCell: UICollectionViewCell {
 
    let appNameButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.setTitle("app name", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.constrainHeight(constant: 10)
        return btn
    }()
    
    let descriptionLabel: CustomLabel = {
       let lbl = CustomLabel(text: "app descriptionapp descriptionapp description", font: .systemFont(ofSize: 30))
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let imageView = UIImageView(cornerRadius: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.constrainHeight(constant: 230)
        imageView.constrainWidth(constant: frame.width)
        
        let stack = VerticalStackView(arrangedSubviews: [appNameButton, descriptionLabel, imageView])
        stack.spacing = 0
        stack.alignment = .leading
        
        addSubview(stack)
        stack.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: AppGroup) {
//        appNameButton.setTitle(model.results![0].name, for: .normal)
//        descriptionLabel.text = model.results![0].genres[0].name
//        guard let imageUrl = URL(string: model.results![0].artworkUrl100!) else { return }
//        imageView.sd_setImage(with: imageUrl)
    }
}
