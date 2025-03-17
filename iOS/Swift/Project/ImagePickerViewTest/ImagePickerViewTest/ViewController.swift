//
//  ViewController.swift
//  ImagePickerViewTest
//
//  Created by Chiwook Ahn on 3/17/25.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    var camera = UIImagePickerController()
    var picker: PHPickerViewController?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        camera.sourceType = .camera
        camera.delegate = self
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = .images
        picker = PHPickerViewController(configuration: config)
        picker?.delegate = self
    }

    @IBAction func photoBtn(_ sender: Any)
    {
        present(picker!, animated: true)
    }
    @IBAction func cameraBtn(_ sender: Any)
    {
        self.present(camera, animated: true)
    }
    @IBAction func choseBtn(_ sender: Any)
    {
        let alert = UIAlertController(title: "사진 선택", message: "사진을 어디에서 가져올 것인가요?", preferredStyle: .actionSheet)
        let camAction = UIAlertAction(title: "카메라", style: .default)
        {
            _ in self.present(self.camera, animated: true)
        }
        let libAction = UIAlertAction(title: "사진첩", style: .default)
        {
            _ in self.present(self.picker!, animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(camAction)
        alert.addAction(libAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let image = info[.originalImage] as? UIImage
        imageView.image = image
        picker.dismiss(animated: true)
    }
}

extension ViewController: PHPickerViewControllerDelegate
{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult])
    {
//        picker.dismiss(animated: true)
//        if let provider = results.first?.itemProvider
//        {
//            if provider.canLoadObject(ofClass: UIImage.self)
//            {
//                provider.loadObject(ofClass: UIImage.self)
//                {
//                    image, error in
//                    if let image = image as? UIImage
//                    {
//                        DispatchQueue.main.async
//                        {
//                            self.imageView.image = image
//                        }
//                    }
//                }
//            }
//        }

        guard let provider = results.first?.itemProvider else { return }
        if provider.canLoadObject(ofClass: UIImage.self)
        {
            provider.loadObject(ofClass: UIImage.self)
            {
                image, error in if let error
                {
                    print("에러 발생 : \(error)")
                }
                if let image = image as? UIImage
                {
                    DispatchQueue.main.async
                    {
                        self.imageView.image = image
                    }
                }
                
            }
        }
        picker.dismiss(animated: true)
        {
            print("Completion")
        }
    }
}
