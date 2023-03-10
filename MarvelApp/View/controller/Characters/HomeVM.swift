//
//  HomeVM.swift
//  MarvelApp
//
//  Created by Celil Aydın on 21.02.2023.
//

import Foundation
import Alamofire

import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

class HomeVM {
    
    static var header: HTTPHeaders = [
          "Accept": "*/*"
      ]
    
    weak var vc : HomeTVC?
    var arrDataClass: DataClass?
    
    var isLoading: Bool = true {
        didSet { self.updateLoadingStatus?() }
    }
    
    var updateLoadingStatus: (() -> ())?
    
    func parseCharacter(pageNumber:Int,comp: @escaping (DataClass) -> Void) {
        
        let ts = "\(Int((Date().timeIntervalSince1970 * 1000.0).rounded()))"
        let hash = HomeVM.MD5Hex(string: "\(ts)\(Constants.privateKey)\(Constants.apiKey)")
        let params = ["apikey" : Constants.apiKey,"ts" : ts,"hash" : hash, "offset" : "\(pageNumber)"]

        guard let url = URL(string: Constants.Character.pageApi) ?? nil else { return }
        
        AF.request(url as URLConvertible, method: .get, parameters: params , encoder: URLEncodedFormParameterEncoder.default, headers: HomeVM.header).response { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(Character.self, from: data)
                    guard let resultData = result.data else { return }
                    self.vc?.characterData = resultData
                    comp(resultData)
                    self.isLoading = false
                }catch {
                    print(error.localizedDescription)
                    self.isLoading = true
                }
            }
        }
    }
    
    static func MD5(string: String) -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    
    static func MD5Hex(string: String) -> String {
        let md5Data = MD5(string: string)
        return md5Data.map { String(format: "%02hhx", $0) }.joined()
    }
  
}

