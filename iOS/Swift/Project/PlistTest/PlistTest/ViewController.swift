//
//  ViewController.swift
//  PlistTest
//
//  Created by Chiwook Ahn on 3/17/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "BTS", withExtension: "plist")
        print(url ?? "")
    }


}

