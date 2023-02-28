//
//  HomeCell.swift
//  MarvelApp
//
//  Created by Celil Aydın on 23.02.2023.
//

import UIKit
import SDWebImage

class TabbarCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func homeConfigure(with model: Results){
        DispatchQueue.main.async {
            self.characterNameLabel.text = model.name
            self.characterImageView.sd_setImage(with:URL(string:"\(model.thumbnail?.path ?? "").\(model.thumbnail?.extension ?? "")"))
        }
    }
    
    func eventConfigure(with model: EventsResults){
        DispatchQueue.main.async {
            self.characterNameLabel.text = model.title
            self.characterImageView.sd_setImage(with:URL(string:"\(model.thumbnail?.path ?? "").\(model.thumbnail?.extension ?? "")"))
        }
    }
    
    func seriesConfigure(with model: SeriesResult){
        DispatchQueue.main.async {
            self.characterNameLabel.text = model.title
            self.characterImageView.sd_setImage(with:URL(string:"\(model.thumbnail?.path ?? "").\(model.thumbnail?.extension ?? "")"))
        }
    }
    
}
