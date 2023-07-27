//
//  CameraViewController.swift
//  CameraApp
//
//  Created by Akihiro Matsuyama on 2023/07/26.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    static func instantiate() -> CameraViewController {
        return UIStoryboard(name: "Camera", bundle: nil).instantiateInitialViewController() as! CameraViewController
    }

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func launchCamera(_ sender: Any) {
        let camera = UIImagePickerController.SourceType.camera
        if UIImagePickerController.isSourceTypeAvailable(camera) {
            let picker = UIImagePickerController()
            picker.sourceType = camera
            picker.delegate = self
            self.present(picker,animated: true)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController,
                                       didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.imageView.image = image
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.dismiss(animated: true)
    }

}
