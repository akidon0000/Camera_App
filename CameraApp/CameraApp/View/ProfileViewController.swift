//
//  CameraViewController.swift
//  CameraApp
//
//  Created by Akihiro Matsuyama on 2023/07/26.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let cameraView = R.nib.cameraView.firstView(withOwner: nil) as? CameraView {
            self.view.addSubview(cameraView)
        }
        print("a")
    }
}
