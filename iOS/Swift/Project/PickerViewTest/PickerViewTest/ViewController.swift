//
//  ViewController.swift
//  PickerViewTest
//
//  Created by Chiwook Ahn on 3/11/25.
//

import UIKit

//class PickerDataSource: NSObject, UIPickerViewDataSource
//{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int
//    {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
//    {
//        return 4
//    }
//}

//class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
//
//    @IBOutlet weak var picker: UIPickerView!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        picker.dataSource = self
//        picker.delegate = self
//    }
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int
//    {
//        return 3
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
//    {
//        return 10
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
//    {
//        return "(\(component + 1), \(row + 1))"
//    }
//
//}

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerBTS: UIPickerView!
    
    let btsName1 = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    let btsName2 = ["김남준", "김석진", "민윤기", "정호석", "박지민", "김태형", "전정국"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerBTS.dataSource = self
        pickerBTS.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0
        {
            return btsName1.count
        }
        else
        {
            return btsName2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == 0
        {
            return btsName1[row]
        }
        else
        {
            return btsName2[row]
        }
    }

}
