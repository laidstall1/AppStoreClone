//
//  AppsViewModel.swift
//  AppStoreClone
//
//  Created by mac on 15/08/2021.
//

import Foundation

class AppsViewModel {
    
    var appsData = [AppDetail]()
    
    func fetchGames(completion: @escaping () -> Void) {
        guard let urlString = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json") else { return }
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                if let data = data {
                    let json = try JSONDecoder().decode(AppsModel.self, from: data)
                    self.appsData.append(json.feed!)
                    completion()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
