//
//  VideoViewController.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        OrientationHandler.lockOrientation(UIInterfaceOrientationMask.landscapeLeft, andRotateTo: UIInterfaceOrientation.landscapeLeft)
    }

}
