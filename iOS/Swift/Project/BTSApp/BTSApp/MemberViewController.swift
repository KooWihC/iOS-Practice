//
//  MemberViewController.swift
//  BTSApp
//
//  Created by Chiwook Ahn on 3/18/25.
//

import UIKit

class MemberViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var member: [String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let member, let imageName = member["image"]
        {
            let image = UIImage(named: imageName)
            imageView.image = image
            nameLabel.text = member["name"]
        }
        // Do any additional setup after loading the view.
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
