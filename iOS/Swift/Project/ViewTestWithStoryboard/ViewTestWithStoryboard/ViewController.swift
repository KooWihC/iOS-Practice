//
//  ViewController.swift
//  ViewTestWithStoryboard
//
//  Created by Chiwook Ahn on 3/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var view1: UIView!
    
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.backgroundColor = .systemGray
        lblName.text = "Hello, IBOutlet!"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }

    @IBAction func BlueBtnTouched(_ sender: Any)
    {
        //print("actBtnTouched")
        lblName.text = "파란 버튼이 눌러졌어요"
        view1.backgroundColor = .systemBlue
        view.addSubview(view1)
    }
    
    @IBAction func redBtnTouched(_ sender: Any)
    {
        lblName.text = "빨간 버튼이 눌러졌어요"
        view1.backgroundColor = .systemRed
        view.addSubview(view1)
    }
}

