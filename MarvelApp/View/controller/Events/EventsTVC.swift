//
//  EventsTVC.swift
//  MarvelApp
//
//  Created by Celil Aydın on 24.02.2023.
//

import UIKit

class EventsTVC: UITableViewController, UIAnimatable {
    
    let vm = EventsVM()
    var eventsData: EventsDataClass?

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        eventParse()
    }
    
    private func setView(){
        title = "Events"
    }
    
    private func eventParse() {
        showLoadingAnimation()
        vm.parseEvent { [weak self] resultEvent in
            self?.hideLoadingAnimation()
            self?.eventsData = resultEvent
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsData?.results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TabbarCell", owner: self, options: nil)?.first as! TabbarCell
        if let eventResults = eventsData?.results {
            let eventResult = eventResults[indexPath.row]
            cell.eventConfigure(with: eventResult)
        }
        return cell
    }

}
