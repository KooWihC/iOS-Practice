//
//  ViewController.swift
//  LottoGenerate
//
//  Created by Chiwook Ahn on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var lottoNumbers: [Int] = []
    
    @IBOutlet weak var lottoPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lottoPicker.delegate = self
        lottoPicker.dataSource = self
        
        lottoNumbers = lotto()
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return lottoNumbers.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return "\(lottoNumbers[row])"
    }
    
    func lotto() -> [Int]
    {
        var numbers = Set<Int>()
        while numbers.count < 6
        {
            let number = Int.random(in: 1...45)
            numbers.insert(number)
        }
        return numbers.sorted()
    }
    
   
    @IBAction func reloadBtn(_ sender: Any)
    {
        lottoNumbers = lotto()
        lottoPicker.reloadAllComponents()
    }
    
}

