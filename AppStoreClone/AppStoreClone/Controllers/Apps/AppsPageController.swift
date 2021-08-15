//
//  AppsController.swift
//  AppStoreClone
//
//  Created by mac on 14/08/2021.
//

import UIKit

private let reuseIdentifier = "cell"
private let headerReuseIdentifier = "headercell"

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
    }
    // MARK:- UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppsGroupCell
        return cell
    }

    // MARK:- UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 50, left: 0, bottom: 0, right: 0)
    }
}
