//
//  AppService.swift
//  AppStoreClone
//
//  Created by mac on 16/08/2021.
//

import Foundation

class AppService {
    static let shared = AppService()
    
    private init() {}
    
    func fetchFeed(endPoint:String, completion: @escaping (Data?, URLResponse?, Error?) -> Void ) {
        guard let urlString = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/\(endPoint)/all/50/explicit.json") else { return }
        URLSession.shared.dataTask(with: urlString, completionHandler: completion).resume()
    }
}
