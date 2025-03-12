//
//  ViewController.swift
//  ReusingView
//
//  Created by Chiwook Ahn on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let bts = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국", "RM1", "진2", "슈가3", "제이홉4", "지민5", "뷔6", "정국7"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return bts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        var label: UILabel?
        // 존나 뭔 얘긴지 모르겠어요
        if let label1 = view
        {
            label = label1 as? UILabel
        }
        else
        {
            label = UILabel()
        }
        label?.text = bts[row]
        return label!
    }
}

