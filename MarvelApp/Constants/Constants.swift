//
//  Constants.swift
//  MarvelApp
//
//  Created by Celil Aydın on 5.03.2023.
//

import Foundation

struct Constants {
    
    static let apiKey = "d8250f05f7e6f2ddd4409ce29499c6cb"
    static let privateKey = "8d7e967bc89d05da24576945ba082aab847e5b15"
    static let tabbarCell = "TabbarCell"
    static let tabbarIdenrifier = "tabbar"
    static let userDefault = "openApp"
    static let storyboard = "Main"
    
    struct Character {
        static let pageApi = "http://gateway.marvel.com/v1/public/characters"
        static let pageTitle = "Characters"
        static let toDetail = "showDetail"
    }
    
    struct Events {
        static let pageApi = "https://gateway.marvel.com:443/v1/public/events"
        static let pageTitle = "Events"
    }
    
    struct Series {
        static let pageApi = "https://gateway.marvel.com:443/v1/public/series"
        static let pageTitle = "Series"
    }
    
    struct Onboarding {
        static let identifier = "onboarding"
    }
    
    struct Animation {
        static let identifier = "animationVC"
    }
    
    struct Detail {
        static let pageApi = "https://gateway.marvel.com:443/v1/public/characters/"
        static let comicCollectionIdentifier = "ComicCollectionViewCell"
        static let eventCollectionIdentifier = "EventCollectionViewCell"
    }
    
}
