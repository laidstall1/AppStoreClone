//
//  AppsSearchController.swift
//  AppStoreClone
//
//  Created by mac on 12/08/2021.

import UIKit

private let reuseIdentifier = "Cell"

class SearchAppsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    let viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        self.collectionView!.register(SearchResultCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        configureSearchBar()
    }
    
    func beginSearch(with searchText: String) {
        viewModel.beginSearchText(searchText) {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    func configureSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "App Store"
    }
    
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.appResult.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchResultCell
        cell.configure(with: viewModel.appResult[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}

extension SearchAppsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        beginSearch(with: searchText)
    }
}
