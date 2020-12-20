//
//  GatewayProtocol.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

protocol GatewayProtocol {
    func getData(_ url:URL, _ completion:@escaping((_ data:Data?, _ error: Error?,URL)->Void))
}
