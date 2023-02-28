//
//  Events.swift
//  MarvelApp
//
//  Created by Celil Aydın on 23.02.2023.
//

import Foundation

// MARK: - Events
struct Events: Decodable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: EventsDataClass?
}

// MARK: - DataClass
struct EventsDataClass: Decodable {
    let offset, limit, total, count: Int?
    let results: [EventsResults]?
}

// MARK: - Result
struct EventsResults: Decodable {
    let id: Int?
    let title, description: String?
    let resourceURI: String?
    let urls: [EventsURLElement]?
    let modified: String?
    let start, end: String?
    let thumbnail: EventsThumbnail?
    let creators: EventsCreators?
    let characters: EventsCharacters?
    let stories: EventsStories?
    let comics, series: EventsCharacters?
    let next, previous: EventsNext?
}

// MARK: - Characters
struct EventsCharacters: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [EventsNext]?
    let returned: Int?
}

// MARK: - Next
struct EventsNext: Decodable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Creators
struct EventsCreators: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [EventsCreatorsItem]?
    let returned: Int?
}

// MARK: - CreatorsItem
struct EventsCreatorsItem: Decodable {
    let resourceURI: String?
    let name: String?
    let role: String?
}

// MARK: - Stories
struct EventsStories: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [EventsStoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct EventsStoriesItem: Decodable {
    let resourceURI: String?
    let name: String?
    let type: String?
}

// MARK: - Thumbnail
struct EventsThumbnail: Decodable {
    let path: String?
    let `extension`: String?
}

// MARK: - URLElement
struct EventsURLElement: Decodable {
    let type: String?
    let url: String?
}
