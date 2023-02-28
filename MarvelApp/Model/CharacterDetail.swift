//
//  CharacterDetail.swift
//  MarvelApp
//
//  Created by Celil Aydın on 26.02.2023.
//

import Foundation

struct CharacterDetail: Decodable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: CharDetailDataClass?
}

// MARK: - DataClass
struct CharDetailDataClass: Decodable {
    let offset, limit, total, count: Int?
    let results: [CharDetailResult]?
}

// MARK: - Result
struct CharDetailResult: Decodable {
    let id: Int?
    let name, description: String?
    let modified: String?
    let thumbnail: CharDetailThumbnail?
    let resourceURI: String?
    let comics, series: CharDetailComics?
    let stories: CharDetailStories?
    let events: CharDetailComics?
    let urls: [CharDetailURLElement]?
}

// MARK: - Comics
struct CharDetailComics: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [CharDetailComicsItem]?
    let returned: Int?
}

// MARK: - ComicsItem
struct CharDetailComicsItem: Decodable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Stories
struct CharDetailStories: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [CharDetailStoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct CharDetailStoriesItem: Decodable {
    let resourceURI: String?
    let name: String?
    let type: String?
}

// MARK: - Thumbnail
struct CharDetailThumbnail: Decodable {
    let path: String?
    let `extension`: String?
}

// MARK: - URLElement
struct CharDetailURLElement: Decodable {
    let type: String?
    let url: String?
}
