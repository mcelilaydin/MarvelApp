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
        setView()
        characterParse(pageNumber: 0)
    }
    
    /*
     //MARK: PAGİNATİON !
    private func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 75))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
     */
    
    private func setView(){
        title = "Characters"
    }
    
    private func characterParse(pageNumber: Int) {
        showLoadingAnimation()
        characterVM.parseCharacter(pageNumber: pageNumber) { [weak self] result in
            self?.hideLoadingAnimation()
            self?.characterData = result
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
            self.performSegue(withIdentifier: "showDetail", sender: self.charDetailData)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
           let destination = segue.destination as? CharacterDetailVC,
           let charDetailData = sender as? CharDetailDataClass {
            destination.charDetailData = charDetailData
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterData?.results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TabbarCell", owner: self, options: nil)?.first as! TabbarCell
        if let characterResults = characterData?.results {
            let characterResult = characterResults[indexPath.row]
            cell.homeConfigure(with: characterResult)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "charDetail") as? CharacterDetailVC
        guard let characterResults = characterData?.results else { return }
        selectRow(id: characterResults[indexPath.row].id ?? 0)
    }
    
}
