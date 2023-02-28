struct Series: Decodable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: SeriesDataClass?
}

// MARK: - DataClass
struct SeriesDataClass: Decodable {
    let offset, limit, total, count: Int?
    let results: [SeriesResult]?
}

// MARK: - Result
struct SeriesResult: Decodable {
    let id: Int?
    let title: String?
    let description: String?
    let resourceURI: String?
    let urls: [SeriesURLElement]?
    let startYear, endYear: Int?
    let rating: String?
    let type: String?
    let modified: String?
    let thumbnail: SeriesThumbnail?
    let creators: SeriesCreators?
    let characters: SeriesCharacters?
    let stories: SeriesStories?
    let comics, events: SeriesCharacters?
    let next: SeriesNext?
    let previous: String?
}

// MARK: - Characters
struct SeriesCharacters: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [SeriesNext]?
    let returned: Int?
}

// MARK: - Next
struct SeriesNext: Decodable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Creators
struct SeriesCreators: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [SeriesCreatorsItem]?
    let returned: Int?
}

// MARK: - CreatorsItem
struct SeriesCreatorsItem: Decodable {
    let resourceURI: String?
    let name, role: String?
}

// MARK: - Stories
struct SeriesStories: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct SeriesStoriesItem: Decodable {
    let resourceURI: String?
    let name: String?
    let type: String?
}

// MARK: - Thumbnail
struct SeriesThumbnail: Decodable {
    let path: String?
    let `extension`: String?
}

// MARK: - URLElement
struct SeriesURLElement: Decodable {
    let type: String?
    let url: String?
}
