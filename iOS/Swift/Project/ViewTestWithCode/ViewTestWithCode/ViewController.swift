//
//  ViewController.swift
//  ViewTestWithCode
//
//  Created by Chiwook Ahn on 3/10/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGreen
        
        let view1 = UIView()
        view1.frame = CGRect(x: 100, y: 300, width: 200, height: 150)
        view1.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.7)
        view.addSubview(view1) // view는 항상 고정띠
        
        let view2 = UIView()
        view2.frame = CGRect(x: 100, y: 350, width: 200, height: 150)
        view2.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.7)
        view.addSubview(view2)
        
        let origin = CGPoint(x: 100, y: 650)
        let size = CGSize(width: 200, height: 100)
        let rect = CGRect(origin: origin, size: size)
        let view3 = UIView(frame: rect)
        view3.backgroundColor = UIColor.gray
        view.addSubview(view3)
        
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 500, width: 300, height: 100)
        label.backgroundColor = .cyan
        label.text = "Hello, Label!"
        label.textColor = .brown
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .bold, width: .condensed)
        view.addSubview(label)
    }


}

