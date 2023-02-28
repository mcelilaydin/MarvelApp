//
//  EventsVM.swift
//  MarvelApp
//
//  Created by Celil Aydın on 24.02.2023.
//

import Foundation
import Alamofire

import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG


class EventsVM {
    
    private var baseUrl = "https://gateway.marvel.com:443/v1/public/events"
    private var apiKey = "d8250f05f7e6f2ddd4409ce29499c6cb"
    private var privateKey = "8d7e967bc89d05da24576945ba082aab847e5b15"
    
    static var header: HTTPHeaders = [
          "Accept": "*/*"
      ]
    
    weak var vc : EventsTVC?
    var arrDataClass: EventsDataClass?
    
    var error: Error? {
        didSet { self.showAlertClosure?() }
    }
    var isLoading: Bool = true {
        didSet { self.updateLoadingStatus?() }
    }
    
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    
    
    func parseEvent(comp: @escaping (EventsDataClass) -> Void) {
        
        let ts = "\(Int((Date().timeIntervalSince1970 * 1000.0).rounded()))"
        let hash = HomeVM.MD5Hex(string: "\(ts)\(privateKey)\(apiKey)")
        let params = ["apikey" : apiKey,"ts" : ts,"hash" : hash]

        guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/events") ?? nil else { return }
        
        AF.request(url as URLConvertible, method: .get, parameters: params , encoder: URLEncodedFormParameterEncoder.default, headers: HomeVM.header).response { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(Events.self, from: data)
                    guard let resultData = result.data else { return }
                    self.vc?.eventsData = resultData
                    comp(resultData)
                    self.isLoading = false
                }catch {
                    print(error.localizedDescription)
                    self.isLoading = true
                }
            }
        }
    }
    
}
