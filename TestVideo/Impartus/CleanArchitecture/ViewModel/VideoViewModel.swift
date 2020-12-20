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
    func reloadCollection()
}

protocol VideoViewModelDataSource : NSObject {
    func numberOfSection() -> Int
    func numberOfRows() -> Int
    func videosAt(index:Int) -> Video
}

class VideoViewModel : NSObject {
    var videos : [Video]?
    var originalVideos : [Video]?
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
        self.filterVideo(index: index)
        self.delegate?.reloadCollection()
    }
    
    func showData(videos: [Video]) {
        self.originalVideos = videos
        self.filterVideo(index: 0)
        self.viewState = .success
    }
    
    func filterVideo(index:Int) {
        var listVideo = [Video]()
        if self.originalVideos != nil {
            for (ind,vdo) in self.originalVideos!.enumerated() {
                if ind != index {
                    listVideo.append(vdo)
                }
            }
        }
        self.videos = listVideo
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
