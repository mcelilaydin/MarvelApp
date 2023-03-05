//
//  HomeTVC.swift
//  MarvelApp
//
//  Created by Celil Aydın on 23.02.2023.
//

import UIKit

class HomeTVC: UITableViewController,UIAnimatable {
    
    let characterVM = HomeVM()
    var characterData: DataClass?
    
    let characterDetailVM = CharacterDetailVM()
    var charDetailData: CharDetailDataClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavi(title: Constants.Character.pageTitle)
        characterParse(pageNumber: characterData?.offset ?? 0)
    }
    
    private func characterParse(pageNumber: Int) {
        showLoadingAnimation()
        characterVM.parseCharacter(pageNumber: pageNumber) { [weak self] result in
            self?.hideLoadingAnimation()
            if self?.characterData == nil {
                self?.characterData = result
            }else {
                self?.characterData?.offset = result.offset ?? 1
                self?.characterData?.results?.append(contentsOf: (result.results)!)
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func selectRow(id: Int){
        showLoadingAnimation()
        characterDetailVM.parseCharacterDetail(characterId: id) { result in
            self.hideLoadingAnimation()
            self.charDetailData = result
            self.performSegue(withIdentifier: Constants.Character.toDetail, sender: self.charDetailData)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Character.toDetail,
           let destination = segue.destination as? CharacterDetailVC,
           let charDetailData = sender as? CharDetailDataClass {
            destination.charDetailData = charDetailData
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterData?.results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(Constants.tabbarCell, owner: self, options: nil)?.first as! TabbarCell
        if let characterResults = characterData?.results {
            let characterResult = characterResults[indexPath.row]
            cell.homeConfigure(with: characterResult)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let characterResults = characterData?.results else { return }
        selectRow(id: characterResults[indexPath.row].id ?? 0)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (characterData?.results?.count ?? 0) - 1 {
        print("another offset request")
        characterParse(pageNumber:(characterData?.offset ?? 1) + 1)
        }
    }
    
}
