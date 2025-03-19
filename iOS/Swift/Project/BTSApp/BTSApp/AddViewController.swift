//
//  AddViewController.swift
//  BTSApp
//
//  Created by Chiwook Ahn on 3/18/25.
//

import UIKit
import PhotosUI

class AddViewController: UIViewController {

    @IBOutlet weak var txtDesc: UITextField!
    @IBOutlet weak var nickTxt: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var camera = UIImagePickerController()
    var picker: PHPickerViewController?
    
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        camera.sourceType = .camera
        camera.delegate = self
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = .images
        
        picker = PHPickerViewController(configuration: config)
        picker?.delegate = self
        
        
    }
    
    @IBAction func photoAdd(_ sender: Any)
    {
        let photoAlert = UIAlertController(title: "사진 추가", message: "사진을 어디에서 추가하시겠습니까?", preferredStyle: .actionSheet)
        let camAlert = UIAlertAction(title: "카메라", style: .default) { _ in
            self.present(self.camera, animated: true)
        }
        let photoLibAlert = UIAlertAction(title: "사진첩", style: .default) { _ in
            self.present(self.picker!, animated: true)
        }
        let cancelAlert = UIAlertAction(title: "취소", style: .cancel)
        
        photoAlert.addAction(camAlert)
        photoAlert.addAction(photoLibAlert)
        photoAlert.addAction(cancelAlert)
        
        present(photoAlert, animated: true)
    }
    
    @IBAction func addBtn(_ sender: Any)
    {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.dismiss(animated: true)
        let image = info[.originalImage] as? UIImage
        imageView.image = image
    }
}

extension AddViewController: PHPickerViewControllerDelegate
{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult])
    {
        
        guard let provider = results.first?.itemProvider else { return }
        if provider.canLoadObject(ofClass: UIImage.self)
        {
            provider.loadObject(ofClass: UIImage.self) { data, error in
                if let error
                {
                    print(error.localizedDescription)
                }
                self.imageView.image = data as? UIImage
            }
        }
        picker.dismiss(animated: true)
    }
}
