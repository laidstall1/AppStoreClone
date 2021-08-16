//
//  AppRowCell.swift
//  AppStoreClone
//
//  Created by mac on 15/08/2021.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    private let appIconImage: UIImageView = {
       let iv = UIImageView()
        iv.backgroundColor = .systemGray5
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.constrainWidth(constant: 64)
        iv.constrainHeight(constant: 64)
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    private let appNameLabel = CustomLabel(text: "The Witness", font: .boldSystemFont(ofSize: 18))
    private let companyNameLabel = CustomLabel(text: "Company name", font: .systemFont(ofSize: 14))
    
    private let getButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("GET", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.setTitleColor(.blue, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.constrainWidth(constant: 80)
        btn.constrainHeight(constant: 32)
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelStack = VerticalStackView(arrangedSubviews: [appNameLabel, companyNameLabel])
        
        let stackView = UIStackView(arrangedSubviews: [appIconImage, labelStack, getButton])
        stackView.alignment = .center
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: AppDetail) {
        appNameLabel.text = model.results![0].name
        companyNameLabel.text = model.results![0].genres[0].name
        guard let imageUrl = URL(string: model.results![0].artworkUrl100!) else { return }
        appIconImage.sd_setImage(with: imageUrl)
    }
}
