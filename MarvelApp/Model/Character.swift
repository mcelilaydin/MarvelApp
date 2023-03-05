//
//  Character.swift
//  MarvelApp
//
//  Created by Celil Aydın on 21.02.2023.
//

import Foundation


// MARK: - Welcome
struct Character: Decodable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Decodable {
    let limit, total, count: Int?
    var offset: Int?
    var results: [Results]?
}

// MARK: - Result
struct Results: Decodable {
    let id: Int?
    let name, resultDescription: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?
}

// MARK: - Comics
struct Comics: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
}

// MARK: - ComicsItem
struct ComicsItem: Decodable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Stories
struct Stories: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct StoriesItem: Decodable {
    let resourceURI: String?
    let name: String?
    let type: String?
}


// MARK: - Thumbnail
struct Thumbnail: Decodable {
    let path: String?
    let `extension`: String?
}

// MARK: - URLElement
struct URLElement: Decodable {
    let type: String?
    let url: String?
}
