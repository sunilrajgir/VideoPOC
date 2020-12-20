//
//  Interactor.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import Foundation

class Interactor {
    let url: URL
    init(_ url: URL) {
        self.url = url
    }
    
    func getData( _ completion:@escaping((_ data:Videos?, _ error: Error?)->Void)) {
        Gateway().getData(url) { [weak self] (data, error, url) in
            if error == nil && self != nil {
                self?.decodeData(data!, completion)
            } else {
                completion(nil,NSError(domain: "1234", code: 1234, userInfo: nil))
            }
        }
    }
    
    func decodeData(_ data:Data, _ completion:@escaping((_ data:Videos?, _ error: Error?)->Void)) {
        Parser().parse(data) { (data, error) in
            if error == nil {
                completion(data,nil)
            } else {
                completion(nil,NSError(domain: "1234", code: 1234, userInfo: nil))
            }
        }
    }
}
