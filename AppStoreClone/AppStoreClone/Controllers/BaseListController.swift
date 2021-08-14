//
//  BaseListController.swift
//  AppStoreClone
//
//  Created by mac on 14/08/2021.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
