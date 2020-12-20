//
//  ViewController.swift
//  TestVideo
//
//  Created by sunil.kumar1 on 12/20/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        OrientationHandler.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }

    @IBAction func testVideoBtnAction(_ sender: UIButton) {
        if let url = URL(string: "https://myapi-45880.firebaseapp.com/videos.json") {
            let netwok = DataHandler(url)
            let videoVc = VideoViewController(netwok)
            navigationController?.pushViewController(videoVc, animated: true)
        }
    }
        
}

