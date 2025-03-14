//
//  MemberViewController.swift
//  BTSNavigationController
//
//  Created by Chiwook Ahn on 3/14/25.
//

import UIKit

class MemberViewController: UIViewController {

    var member: BTS?
    var imageName: String?
    var nick: String?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var memberImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let imageName
//        {
//            let image = UIImage(named: imageName)
//            memberImage.image = image
//        }
//        
//        nameLabel.text = nick
        
        if let member
        {
            let image = UIImage(named: member.image)
            memberImage.image = image
        }
        nameLabel.text = member?.nick
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
