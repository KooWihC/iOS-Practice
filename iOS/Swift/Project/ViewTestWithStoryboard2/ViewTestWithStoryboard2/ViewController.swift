//
//  ViewController.swift
//  ViewTestWithStoryboard2
//
//  Created by Chiwook Ahn on 3/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.insertSegment(withTitle: "랴", at: 3, animated: true)
        segment.setTitle("랄", forSegmentAt: 2)
        //segment.setEnabled(false, forSegmentAt: 2)
        segment.selectedSegmentIndex = 1
        
        slider.minimumValue = 0
        slider.maximumValue = 10
        
    }

    @IBAction func segmentChanged(_ sender: Any)
    {
        let selected = segment.selectedSegmentIndex
        print("\(selected + 1)번째 segment가 선택되었습니다.")
    }
    
    @IBAction func switchAction(_ sender: UISwitch)
    {
        let switchOn = sender.isOn
        if switchOn
        {
            switchLabel.text = "야랄라라라얼알ㅇㄹ"
            imageView.image = UIImage(systemName: "person.fill")
        }
        else
        {
            switchLabel.text = "Zzzzz..."
            imageView.image = UIImage(systemName: "person")
        }
    }
    
    @IBOutlet weak var baboLabel: UILabel!
    
    @IBAction func stepperUp(_ sender: UIStepper)
    {
        let count = sender.value
        baboLabel.text = "바보 스택 \(count)개"
    }
    
    @IBAction func sliderChange(_ sender: UISlider)
    {
        let current = sender.value
        print("슬라이더의 현재 값은 \(current) 입니다.")
    }
}

