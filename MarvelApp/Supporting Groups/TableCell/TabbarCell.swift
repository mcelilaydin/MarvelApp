//
//  HomeCell.swift
//  MarvelApp
//
//  Created by Celil Aydın on 23.02.2023.
//

import UIKit
import SDWebImage

class TabbarCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescLabel: UILabel!
    
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
            self.itemNameLabel.text = model.name
            self.itemImageView.sd_setImage(with:URL(string:"\(model.thumbnail?.path ?? "").\(model.thumbnail?.extension ?? "")"))
            if model.description != "" && model.description != nil {
                self.itemDescLabel.text = model.description
            } else {
                self.itemDescLabel.text = "Description does not exist."
            }
        }
    }
    
    func eventConfigure(with model: EventsResults){
        DispatchQueue.main.async {
            self.itemNameLabel.text = model.title
            self.itemImageView.sd_setImage(with:URL(string:"\(model.thumbnail?.path ?? "").\(model.thumbnail?.extension ?? "")"))
            if model.description != "" && model.description != nil {
                self.itemDescLabel.text = model.description
            } else {
                self.itemDescLabel.text = "Description does not exist."
            }
        }
    }
    
    func seriesConfigure(with model: SeriesResult){
        DispatchQueue.main.async {
            self.itemNameLabel.text = model.title
            self.itemImageView.sd_setImage(with:URL(string:"\(model.thumbnail?.path ?? "").\(model.thumbnail?.extension ?? "")"))
            if model.description != "" && model.description != nil {
                self.itemDescLabel.text = model.description
            } else {
                self.itemDescLabel.text = "Description does not exist."
            }
        }
    }
    
}
