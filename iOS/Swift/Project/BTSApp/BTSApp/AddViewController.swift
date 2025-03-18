//
//  AddViewController.swift
//  BTSApp
//
//  Created by Chiwook Ahn on 3/18/25.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func photoAdd(_ sender: Any)
    {
        let photoAlert = UIAlertController(title: "사진 추가", message: "사진을 어디에서 추가하시겠습니까?", preferredStyle: .alert)
        let camAlert = UIAlertAction(title: "카메라", style: .default)
        let photoLibAlert = UIAlertAction(title: "사진첩", style: .default)
        let cancelAlert = UIAlertAction(title: "취소", style: .cancel)
        
        photoAlert.addAction(camAlert)
        photoAlert.addAction(photoLibAlert)
        photoAlert.addAction(cancelAlert)
        
        present(photoAlert, animated: true)
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
