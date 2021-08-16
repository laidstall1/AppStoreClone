//
//  AppsHorizontalController.swift
//  AppStoreClone
//
//  Created by mac on 14/08/2021.
//
import UIKit

private let reuseIdentifier = "cell"

class AppsHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    //  MARK: -  Properties
    private let viewModel = AppsViewModel()
    
    //  MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    //  MARK: -  UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.appsData?.feed.results.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppRowCell
        cell.configure(with: viewModel.appsData!, index: indexPath.item)
        return cell
    }
    
    //  MARK: -  UICollectionViewDelegateFlowLayout
    let topBottomSpacing: CGFloat = 10
    let lineSpacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - topBottomSpacing * 2 - lineSpacing * 2) / 3
        return .init(width: view.frame.width - 48, height: height )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomSpacing, left: 16, bottom: topBottomSpacing, right: 16)
    }
}
