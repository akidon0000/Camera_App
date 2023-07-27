//
//  MainViewController.swift
//  CameraApp
//
//  Created by Akihiro Matsuyama on 2023/07/26.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var takePhotoButtonWidthConstraint: NSLayoutConstraint!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTakePhotoButton()
    }

    // MARK: - IBAction

    @IBAction func takePhotoButton(_ sender: Any) {
        let vc = ProfileViewController.instantiate()
        present(vc, animated: true)
    }

    // MARK: - Methods [Private]

    private func setupTakePhotoButton() {
        takePhotoButton.setTitle(NSLocalizedString("take photo", comment: ""), for: .normal)
        takePhotoButton.tintColor = .white
        takePhotoButton.backgroundColor = .blue
        takePhotoButton.layer.cornerRadius = 10.0
        takePhotoButtonWidthConstraint.constant = view.frame.width / 2
    }
}
