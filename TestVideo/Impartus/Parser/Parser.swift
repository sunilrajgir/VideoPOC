//
//  Parser.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

class Parser:ParserProtocol  {
    func parse(_ data:Data, _ completion:((_ data:Videos?, _ error: Error?)->Void)){
        do {
            let videos = try JSONDecoder().decode(Videos.self, from: data)
            completion(videos,nil)
        } catch  {
            completion(nil,NSError(domain: "1234", code: 1234, userInfo: nil))
        }
    }
}
