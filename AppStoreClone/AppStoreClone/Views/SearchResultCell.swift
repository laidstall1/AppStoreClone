//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by mac on 12/08/2021.
//

import UIKit
import SDWebImage

class SearchResultCell: UICollectionViewCell {
    
    private let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.setDimensions(height: 64, width: 64)
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "APP NAME"
        return lbl
    }()
    
    private let categoryLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Photos and Videos"
        return lbl
    }()
    
    private let ratingsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "9.24M"
        return lbl
    }()
    
    private let getButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("GET", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.backgroundColor = UIColor(white: 0.9, alpha: 0.7)
        btn.layer.cornerRadius = 16
        btn.setDimensions(height: 32, width: 80)
        return btn
    }()
    
    lazy var screenshot1ImageView = createScreenshotImageView()
    lazy var screenshot2ImageView = createScreenshotImageView()
    lazy var screenshot3ImageView = createScreenshotImageView()
    
    
    func createScreenshotImageView() -> UIImageView {
        let iv = UIImageView()
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        iv.contentMode = .scaleAspectFill
        return iv
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        let labelStackView = VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        
        let infoTopStack = UIStackView(arrangedSubviews: [appIconImageView, labelStackView, getButton])
        infoTopStack.axis = .horizontal
        infoTopStack.alignment = .center
        infoTopStack.spacing = 12
        
        let screenshotStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
        screenshotStackView.axis = .horizontal
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually

        let overallStackView = VerticalStackView(arrangedSubviews: [infoTopStack, screenshotStackView], spacing: 16)

        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: SearchResult) {
        guard let imageUrl = URL(string: model.artwork!) else { return }
        nameLabel.text = model.trackName
        categoryLabel.text = model.genreName
        ratingsLabel.text = "\(String(format: "%.2f", model.rating ?? 0))"
        
        appIconImageView.sd_setImage(with: imageUrl)
        screenshot1ImageView.sd_setImage(with: URL(string: model.imagesUrl[0]))
        
        if model.imagesUrl.count > 1 && model.imagesUrl.count < 3 {
            screenshot2ImageView.sd_setImage(with:  URL(string: model.imagesUrl[1]))
        } else if model.imagesUrl.count > 2 {
            screenshot2ImageView.sd_setImage(with:  URL(string: model.imagesUrl[1]))
            screenshot3ImageView.sd_setImage(with:  URL(string: model.imagesUrl[2]))
        }
    }
    
}
