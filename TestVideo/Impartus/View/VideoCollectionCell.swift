//
//  VideoCollectionCell.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

class VideoCollectionCell: UICollectionViewCell {
    @IBOutlet var headlineLable: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.headlineLable.text = ""
        self.imageView.image = nil
    }
    func configureCell(video:Video) {
        headlineLable.text = video.headline
    }
}
