//
//  Controller.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

class Controller {
    let interactor: Interactor
    let presenter: Presenter
    
    init(_ interactor: Interactor, _ presenter: Presenter) {
        self.interactor = interactor
        self.presenter = presenter
    }
    
    func getData() {
        self.interactor.getData() { [weak self](data, error) in
            self?.presenter.processData(data: data, error: error)
        }
    }
    
    func playVideo(_ index:Int) {
        presenter.playVideo(index)
    }
}
