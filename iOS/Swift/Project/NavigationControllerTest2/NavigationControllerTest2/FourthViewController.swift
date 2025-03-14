//
//  FourthViewController.swift
//  NavigationControllerTest2
//
//  Created by Chiwook Ahn on 3/14/25.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actPrev(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func toRoot(_ sender: Any)
    {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func act2nd(_ sender: Any)
    {
        guard let viewControllers = navigationController?.viewControllers else
        {
            return
        }
        for viewController in viewControllers
        {
            if let secondVC = viewController as? SecondViewController
            {
                navigationController?.popToViewController(secondVC, animated: true)
            }
        }
    }
    

}
