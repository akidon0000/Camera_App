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
//        var view = UIView()
////        view = R.nib.cameraView
//        view.custom
//        self.view.addSubview(view)
        if let cameraView = R.nib.cameraView.firstView(withOwner: nil) as? CameraView {
            self.view.addSubview(cameraView)
        }
        print("a")
    }
}
