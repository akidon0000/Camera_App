//
//  CameraViewController.swift
//  CameraApp
//
//  Created by Akihiro Matsuyama on 2023/07/26.
//

import UIKit

class ProfileViewController: UIViewController {

//    let cameraView = CameraView()

    static func instantiate() -> ProfileViewController {
        return UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController() as! ProfileViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = CameraView.instantiate()
//        self.view.addSubview(cameraView)
    }
}
