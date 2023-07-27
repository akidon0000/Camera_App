//
//  CameraViewController.swift
//  CameraApp
//
//  Created by Akihiro Matsuyama on 2023/07/26.
//

import UIKit

class ProfileViewController: UIViewController {

    var cameraView: CameraView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let cv = R.nib.cameraView.firstView(withOwner: nil) as? CameraView {
//            cameraView = cv
//
//            cameraView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 44)
//            cameraView.delegate = self
//            print(self.view.frame)
//            print(cameraView.frame)
//            self.view.addSubview(cameraView)
//        }
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if let cv = R.nib.cameraView.firstView(withOwner: nil) as? CameraView {
            cameraView = cv

            cameraView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 44)
            cameraView.delegate = self
            print(self.view.frame)
            print(cameraView.frame)
            self.view.addSubview(cameraView)
        }
    }

    public func dismissCameraView() {
        cameraView.isHidden = true
    }
}
