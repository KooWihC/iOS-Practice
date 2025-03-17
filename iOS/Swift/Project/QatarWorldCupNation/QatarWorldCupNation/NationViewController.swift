//
//  NationViewController.swift
//  QatarWorldCupNation
//
//  Created by Chiwook Ahn on 3/14/25.
//

import UIKit

class NationViewController: UIViewController {

    var nation: Nation?
    
    @IBOutlet weak var descText: UITextView!
    //@IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var flagImg: UIImageView!
    @IBOutlet weak var nationLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        if let nation
//        {
//            descLabel.text = nation.description
//            flagImg.image = UIImage(named: nation.flag)
//            flagImg.contentMode = .scaleAspectFill
//            nationLabel.text = nation.name
//            groupLabel.text = nation.group + "조"
//        }
        guard let nation = nation else { return }
        //descLabel.text = nation.description
        flagImg.image = UIImage(named: nation.flag)
        flagImg.contentMode = .scaleAspectFill
        
        nationLabel.text = nation.name
        
        groupLabel.text = nation.group + "조"
        
        descText.text = nation.description
        descText.font = .systemFont(ofSize: 20)
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
