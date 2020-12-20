//
//  ParserProtocol.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

protocol ParserProtocol {
    func parse<T:Codable>(_ data:Data, _ model:T, _ completion:((_ data:T?, _ error: Error?)->Void))
}
