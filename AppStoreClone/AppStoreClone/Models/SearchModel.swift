//
//  SearchModel.swift
//  AppStoreClone
//
//  Created by mac on 13/08/2021.
//

import Foundation

struct SearchModel: Codable {
    let resultCount: Int?
    let results: [SearchResult]
}

struct SearchResult: Codable {
    let trackName: String?
    let genreName: String?
    let rating: Float?
    let artwork: String?
    let imagesUrl: [String]
    
    enum CodingKeys: String, CodingKey {
        case trackName, artwork = "artworkUrl100", imagesUrl = "screenshotUrls"
        case genreName = "primaryGenreName"
        case rating = "averageUserRating"
    }
}
