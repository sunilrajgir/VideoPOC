//
//  Presenter.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import Foundation

class Presenter {
    let viewModel : VideoViewModel
    init(viewModel:VideoViewModel) {
        self.viewModel = viewModel
    }
    
    func processData(data:Videos?,error:Error?) {
        if error == nil {
            viewModel.showData(videos: data!.items)
        } else {
            viewModel.showError(error: error!)
        }
    }
    
    func playVideo(_ index:Int) {
        viewModel.playVideo(index)
    }
}
