//
//  DetailCollectionViewCell.swift
//  MarvelApp
//
//  Created by Celil Aydın on 26.02.2023.
//

import UIKit

class CollectionViewsCell: UICollectionViewCell {
    
    @IBOutlet weak var comicsNameLabel: UILabel!
    
    @IBOutlet weak var eventsNameLabel: UILabel!
    @IBOutlet weak var seriesNameLabel: UILabel!
    
    func comicsConfigure(with model: CharDetailComicsItem){
        DispatchQueue.main.async {
            self.comicsNameLabel.text = model.name
        }
    }
    
    func eventsConfigure(with model: CharDetailComicsItem){
        DispatchQueue.main.async {
            self.eventsNameLabel.text = model.name
        }
    }
    
    func seriesConfigure(with model: CharDetailComicsItem){
        DispatchQueue.main.async {
            self.seriesNameLabel.text = model.name
        }
    }
}
