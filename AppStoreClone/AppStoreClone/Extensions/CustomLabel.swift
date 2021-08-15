//
//  CustomLabel.swift
//  AppStoreClone
//
//  Created by mac on 14/08/2021.
//

import UIKit

class CustomLabel: UILabel {
    init(text: String, font: UIFont) {
        super.init(frame: .zero)
        self.font = font
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
