//
//  Gateway.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

class Gateway: GatewayProtocol {
    func getData(_ url: URL, _ completion: @escaping ((Data?, Error?,URL) -> Void)) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) {(data, response, error) in
            completion(data,error,url)
        }.resume()
    }
}
