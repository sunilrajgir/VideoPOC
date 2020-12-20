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
        let viewModel = VideoViewModel()
        let presenter = Presenter(viewModel: viewModel)
        let interactor = Interactor(URL(string: "https://myapi-45880.firebaseapp.com/videos.json")!)
        let controller = Controller(interactor, presenter)
        let videoViewController = VideoViewController(controller)
        videoViewController.dataSource = viewModel
        viewModel.delegate = videoViewController
        navigationController?.pushViewController(videoViewController, animated: true)
    }
        
}

