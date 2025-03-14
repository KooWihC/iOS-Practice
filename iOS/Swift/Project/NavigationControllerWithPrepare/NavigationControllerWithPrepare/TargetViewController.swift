//
//  TargetViewController.swift
//  NavigationControllerWithPrepare
//
//  Created by Chiwook Ahn on 3/14/25.
//

import UIKit

class TargetViewController: UIViewController {

    var str: String?
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        label.text = str
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
