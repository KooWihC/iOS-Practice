//
//  SecondViewController.swift
//  NavigationControllerTest2
//
//  Created by Chiwook Ahn on 3/14/25.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actToWhite(_ sender: Any)
    {
//        if let whiteVC = storyboard?.instantiateViewController(withIdentifier: "WhiteVC")
//        {
//            navigationController?.pushViewController(whiteVC, animated: true)
//        }
        guard let whiteVC = self.storyboard?.instantiateViewController(withIdentifier: "WhiteVC")
        else{ return }
        self.navigationController?.pushViewController(whiteVC, animated: true)
    }
    
    @IBAction func actTo4th(_ sender: Any)
    {
        if let fourthVC = storyboard?.instantiateViewController(withIdentifier: "4thVC")
        {
            navigationController?.pushViewController(fourthVC, animated: true)
        }
    }
    @IBAction func actPrev(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    

}
