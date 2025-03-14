//
//  ThirdViewController.swift
//  NavigationControllerTest2
//
//  Created by Chiwook Ahn on 3/14/25.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actPrev(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
        
    

}
