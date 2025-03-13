//
//  ThirdViewController.swift
//  NavigationControllerTest
//
//  Created by Chiwook Ahn on 3/13/25.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    

    @IBAction func goToRoot(_ sender: Any)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
