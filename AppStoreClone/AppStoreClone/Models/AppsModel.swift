//
//  AppsModel.swift
//  AppStoreClone
//
//  Created by mac on 13/08/2021.
//

import Foundation

// MARK: - AppsModel
struct AppsModel: Codable {
    let feed: AppDetail?
}

// MARK: - Feed
struct AppDetail: Codable {
    let title: String?
    let id: String?
    let copyright, country: String?
    let icon: String?
    let updated: String?
    let results: [FeedResult]?
}

// MARK: - Result
struct FeedResult: Codable {
    let artistName, id, releaseDate, name: String?
    let copyright, artistID: String?
    let artistURL: String?
    let artworkUrl100: String?
    let genres: [Genre]
    let url: String?
    let contentAdvisoryRating: String?

    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url, contentAdvisoryRating
    }
}

struct Genre: Codable {
    let genreID, name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}
