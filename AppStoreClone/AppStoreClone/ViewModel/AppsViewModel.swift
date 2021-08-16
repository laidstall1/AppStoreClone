//
//  AppsViewModel.swift
//  AppStoreClone
//
//  Created by mac on 15/08/2021.
//

import Foundation

class AppsViewModel {
    
    var appsData: AppsModel?
    var appGroup = [AppsModel]()
    
    func fetchTopFreeApps(completion: @escaping () -> Void) {
        AppService.shared.fetchFeed(endPoint: "top-free") { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                if let data = data {
                let json = try JSONDecoder().decode(AppsModel.self, from: data)
                self.appsData = json
                self.appGroup.append(json)
                completion()
              }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchNewGames(completion: @escaping () -> Void) {
        AppService.shared.fetchFeed(endPoint: "new-games-we-love") { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                if let data = data {
                let json = try JSONDecoder().decode(AppsModel.self, from: data)
//                self.appsData = json
                self.appGroup.append(json)
                completion()
              }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
