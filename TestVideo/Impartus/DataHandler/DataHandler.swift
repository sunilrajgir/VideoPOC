//
//  NetworkManager.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

class DataHandler {
    let url: URL
    init(_ url: URL) {
        self.url = url
    }
    
    func getData<T:Codable>(_ model:T, _ completion:@escaping((_ data:Any?, _ error: Error?)->Void)) {
        Gateway().getData(url) { [weak self] (data, error, url) in
            if error == nil && self != nil {
                self?.decodeData(data!,model, completion)
            } else {
                completion(nil,NSError(domain: "1234", code: 1234, userInfo: nil))
            }
        }
    }
    
    func decodeData<T:Codable>(_ data:Data, _ model:T, _ completion:@escaping((_ data:Any?, _ error: Error?)->Void)) {
        Parser().parse(data, model) { (data, error) in
            if error == nil {
                completion(data,nil)
            } else {
                completion(nil,NSError(domain: "1234", code: 1234, userInfo: nil))
            }
        }
    }
}





