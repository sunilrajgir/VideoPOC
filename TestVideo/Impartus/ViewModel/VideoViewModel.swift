//
//  VideoViewModel.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

enum ViewState {
    case success
    case error
    case loader
}

protocol VideoViewModelDelegate : NSObject {
    func showData()
    func showError()
    func showLoader()
}

protocol VideoViewModelDataSource : NSObject {
    func numberOfSection() -> Int
    func numberOfRows() -> Int
    func videosAt(index:Int) -> Video
}

class VideoViewModel : NSObject {
    var videos : [Video]?
    weak var delegate : VideoViewModelDelegate?
    var viewState : ViewState = .loader {
        didSet {
           setupScreen()
        }
    }
    
    func setupScreen() {
        switch viewState {
            case .loader:
                delegate?.showLoader()
            case .success:
                delegate?.showData()
            case .error:
                delegate?.showError()
        }
    }
    

}

// MARK:- Presenter Interface
extension VideoViewModel {
    func playVideo(_ index:Int) {
        
    }
    
    func showData(videos: [Video]) {
        self.videos = videos
        self.viewState = .success
    }
    
    func showError(error: Error) {
        self.videos = nil
        self.viewState = .error
    }
}

//MARK:- View Interface
extension VideoViewModel : VideoViewModelDataSource {
    
    func numberOfSection() -> Int {
        if videos != nil && videos!.count > 0 {
            return 1
        } else {
            return 0
        }
    }
    
    func numberOfRows() -> Int {
        if videos != nil && videos!.count > 0 {
            return videos!.count
        } else {
            return 0
        }
    }
    
    func videosAt(index:Int) -> Video {
        return self.videos![index]
    }
}
