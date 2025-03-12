//
//  ViewController.swift
//  PickerViewWithView
//
//  Created by Chiwook Ahn on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let bts = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return bts.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let label = UILabel()
        label.text = bts[row]
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        label.backgroundColor = .systemPurple
        return label
    }
}

