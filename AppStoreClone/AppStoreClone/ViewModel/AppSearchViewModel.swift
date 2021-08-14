//
//  AppSearchViewModel.swift
//  AppStoreClone
//
//  Created by mac on 13/08/2021.
//

import Foundation

class AppSearchViewModel {

    var appResult = [SearchResult]()
    
    func fetchItunesApps(searchString: String, completion: @escaping () -> Void) {
        let urlString = "https://itunes.apple.com/search?term=\(searchString)&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data {
                let json = try? JSONDecoder().decode(SearchModel.self, from: data)
                self.appResult = json!.results
                completion()
            }
        }.resume()
    }
    
    var timer: Timer?
    
    func beginSearchText(_ searchText: String, completion: @escaping () -> Void) {
        // throtling the search - introducing a delay before search
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.fetchItunesApps(searchString: searchText, completion: completion)
        })
    }

}
