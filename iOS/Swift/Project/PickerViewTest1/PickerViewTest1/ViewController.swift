//
//  ViewController.swift
//  PickerViewTest1
//
//  Created by Chiwook Ahn on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
//    let emo1 = PickerDataSource()
//    let emo2 = PickerDelegate()
    
    @IBOutlet weak var pickLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return "\(row + 1) 번째"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        pickLabel.text = "\(row + 1) 번째 row"
    }

}

