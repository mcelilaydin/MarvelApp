//
//  CharacterDetailVC.swift
//  MarvelApp
//
//  Created by Celil Aydın on 25.02.2023.
//

import UIKit
import SDWebImage
import SafariServices

class CharacterDetailVC: UIViewController,UIAnimatable, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterComicsLabel: UILabel!
    @IBOutlet weak var characterEventsLabel: UILabel!
    @IBOutlet weak var comicsdetailCollection: UICollectionView!
    @IBOutlet weak var eventsdetailCollection: UICollectionView!
    var charDetailData: CharDetailDataClass?
    let characterDetailVM = CharacterDetailVM()
    var characterID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setView()
    }
    
    private func setCollectionView(){
        comicsdetailCollection.delegate = self
        comicsdetailCollection.dataSource = self
        eventsdetailCollection.dataSource = self
        eventsdetailCollection.delegate = self
    }
    
    private func setView() {
        characterEventsLabel.text = "Events"
        characterComicsLabel.text = "Comics"
        guard let data = charDetailData?.results?[0] else { return }
        characterNameLabel.text = data.name
        characterImageView.sd_setImage(with: URL(string: "\(data.thumbnail?.path ?? "").\(data.thumbnail?.extension ?? "")"))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == comicsdetailCollection {
            if charDetailData?.results?[0].comics?.items?.count == 0 {
                return 1
            }else{
                return charDetailData?.results?[0].comics?.items?.count ?? 0
            }
        }else {
            if charDetailData?.results?[0].events?.items?.count == 0 {
                return 1
            }else {
                return charDetailData?.results?[0].events?.items?.count ?? 0
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == comicsdetailCollection {
            let cell = comicsdetailCollection.dequeueReusableCell(withReuseIdentifier: "ComicCollectionViewCell", for: indexPath) as! CollectionViewsCell
            if let charDetailData = self.charDetailData {
                if charDetailData.results?[0].comics?.items?.count == 0 {
                    cell.comicsNameLabel.text = "Comics does not exist."
                }else {
                    let c = charDetailData.results?[0].comics?.items?[indexPath.row]
                    cell.comicsConfigure(with: c!)
                }
            }
            return cell
        } else {
            let cell = eventsdetailCollection.dequeueReusableCell(withReuseIdentifier: "EventCollectionViewCell", for: indexPath) as! CollectionViewsCell
            if let charDetailData = self.charDetailData {
                if charDetailData.results?[0].events?.items?.count == 0 {
                    cell.eventsNameLabel.text = "Events does not exist."
                }else {
                    let c = charDetailData.results?[0].events?.items?[indexPath.row]
                    cell.eventsConfigure(with: c!)
                }
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    @IBAction func wikiButtonClicked(_ sender: Any) {
        guard let url = URL(string: charDetailData?.results?[0].urls?[1].url ?? "") else { return }
        let vc = SFSafariViewController(url: url)
        self.present(vc, animated: true)
    }
    
    @IBAction func detailButtonClicked(_ sender: Any) {
        guard let url = URL(string: charDetailData?.results?[0].urls?[0].url ?? "") else { return }
        let vc = SFSafariViewController(url: url)
        self.present(vc, animated: true)
    }
    
}
