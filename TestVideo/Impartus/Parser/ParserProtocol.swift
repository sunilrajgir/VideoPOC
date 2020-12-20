//
//  ParserProtocol.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

protocol ParserProtocol {
    func parse(_ data:Data, _ completion:((_ data:Videos?, _ error: Error?)->Void))
}
