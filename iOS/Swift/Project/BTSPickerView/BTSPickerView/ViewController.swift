//
//  ViewController.swift
//  BTSPickerView
//
//  Created by Chiwook Ahn on 3/11/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var BTSpicker: UIPickerView!
    @IBOutlet weak var akaLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let btsAKA = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    let btsName = ["김남준", "김석진", "민윤기", "정호석", "박지민", "김태형", "전정국"]
    override func viewDidLoad() {
        super.viewDidLoad()
        BTSpicker.dataSource = self
        BTSpicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0
        {
            return btsAKA.count
        }
        else
        {
            return btsName.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == 0
        {
            return btsAKA[row]
        }
        else
        {
            return btsName[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0
        {
            akaLabel.text = btsAKA[row]
        }
        else
        {
            nameLabel.text = btsName[row]
        }
    }

}

