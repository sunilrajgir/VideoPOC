//
//  VideoViewController.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

class VideoViewController: UIViewController {
    @IBOutlet var playerView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    let controller : Controller
    weak var dataSource : VideoViewModelDataSource!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ controller:Controller) {
        self.controller = controller
        super.init(nibName: "VideoViewController", bundle: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        controller.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        OrientationHandler.lockOrientation(UIInterfaceOrientationMask.landscapeLeft, andRotateTo: UIInterfaceOrientation.landscapeLeft)
    }
    
    func setupCollectionView() {
        collectionView.register(UINib(nibName: "VideoCollectionCell", bundle: nil), forCellWithReuseIdentifier: "VideoCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func showDataAndPlayVideo() {
        
    }
}

extension VideoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.numberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionCell", for: indexPath) as! VideoCollectionCell
        cell.configureCell(video: dataSource.videosAt(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.controller.playVideo(indexPath.row)
    }
}

// MARK:- VideoViewModelProtocol
extension VideoViewController : VideoViewModelDelegate {
    func showData() {
        self.showDataAndPlayVideo()
    }
    
    func showError() {
        
    }
    
    func showLoader() {
        
    }
}


