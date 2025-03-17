//
//  ViewController.swift
//  AlertViewController
//
//  Created by Chiwook Ahn on 3/17/25.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func firstBtn(_ sender: Any)
    {
        let alert = UIAlertController(title: "Alert Title", message: "~를 알려드립니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @IBAction func secondBtn(_ sender: Any)
    {
        let alert = UIAlertController(title: "Alert Title", message: "~를 할까말까요?", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "확인", style: .default)
        {
            _ in print("확인했습니다.")
        }
        let actionCancle = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(actionOK)
        alert.addAction(actionCancle)
        present(alert, animated: true)
    }
    
    @IBAction func thirdBtn(_ sender: Any)
    {
        let alert = UIAlertController(title: "Alert Title", message: "~를 선택하세요", preferredStyle: .actionSheet)
        let actionOK = UIAlertAction(title: "확인", style: .default)
        {
            _ in print("확인했습니다.")
        }
        let actionCancel = UIAlertAction(title: "취소", style: .cancel)
        let actionDest = UIAlertAction(title: "삭제", style: .destructive)
        {
            _ in print("삭제했습니다.")
        }
        
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        alert.addAction(actionDest)
        present(alert, animated: true)
    }
}

