//
//  CameraViewController.swift
//  CameraApp
//
//  Created by Akihiro Matsuyama on 2023/07/26.
//

import UIKit

class CameraViewController: UIViewController {

    static func instantiate() -> CameraViewController {
        return UIStoryboard(name: "Camera", bundle: nil).instantiateInitialViewController() as! CameraViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
