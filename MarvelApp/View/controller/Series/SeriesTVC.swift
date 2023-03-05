//
//  StoriesTVC.swift
//  MarvelApp
//
//  Created by Celil Aydın on 25.02.2023.
//

import UIKit

class SeriesTVC: UITableViewController,UIAnimatable {
    
    let vm = SeriesVM()
    var seriesData: SeriesDataClass?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavi(title: Constants.Series.pageTitle)
        seriesParse()
    }
    
    private func seriesParse() {
        showLoadingAnimation()
        vm.parseSerie { [weak self] resultSerie in
            self?.hideLoadingAnimation()
            self?.seriesData = resultSerie
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seriesData?.results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(Constants.tabbarCell, owner: self, options: nil)?.first as! TabbarCell
        if let seriesResults = seriesData?.results {
            let seriesResult = seriesResults[indexPath.row]
            cell.seriesConfigure(with: seriesResult)
        }
        return cell
    }
    
}
