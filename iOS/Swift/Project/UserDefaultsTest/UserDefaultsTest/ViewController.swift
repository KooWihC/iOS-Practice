//
//  ViewController.swift
//  UserDefaultsTest
//
//  Created by Chiwook Ahn on 3/20/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actSave(_ sender: Any)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue("치치", forKey: "name")
        userDefaults.setValue(26, forKey: "age")
        userDefaults.setValue(true, forKey: "isOn")
    }
    
    @IBAction func actGetName(_ sender: Any)
    {
        let name = UserDefaults.standard.string(forKey: "name")
        label.text = name
    }
    
    @IBAction func actGetAge(_ sender: Any)
    {
        let age = UserDefaults.standard.string(forKey: "age")
        label.text = "\(age)"
    }
    
}

