//
//  Parser.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

class Parser:ParserProtocol  {
    func parse<T:Codable>(_ data:Data, _ model:T, _ completion:((_ data:T?, _ error: Error?)->Void)){
        do {
            let videos = try JSONDecoder().decode(model as! T.Type, from: data)
            completion(videos,nil)
        } catch  {
            completion(nil,NSError(domain: "1234", code: 1234, userInfo: nil))
        }
    }
}
