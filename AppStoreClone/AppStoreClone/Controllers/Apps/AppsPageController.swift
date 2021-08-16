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
    //  MARK: -  Properties
    private let viewModel = AppsViewModel()
    
    //  MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        configureCollectionView()
        viewModelListener()
    }
    
    //  MARK: -  Helpers
    func viewModelListener() {
        viewModel.fetchTopFreeApps {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    func configureCollectionView() {
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(AppsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        collectionView.delegate = self
    }
    
    // MARK:- UICollectionViewDataSource

    // MARK: CollectionViewHeader
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath)
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.appGroup.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppsGroupCell
        cell.titleLabel.text = viewModel.appsData?.feed.title
        return cell
    }

    // MARK:- UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
