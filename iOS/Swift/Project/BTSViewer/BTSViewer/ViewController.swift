//
//  ViewController.swift
//  BTSViewer
//
//  Created by Chiwook Ahn on 3/7/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    let images = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    var index = 0
    let btsName = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = index // pageControl 초기화
        
        displayImage() // refactoring
    }
    @IBAction func actPrev(_ sender: Any) {
        if index > 0
        {
            index -= 1
        }
        displayImage()
    }
    
    @IBAction func actNext(_ sender: Any) {
        if index < 6
        {
            index += 1
        }
        displayImage()
    }
    func displayImage()
    {
        pageControl.currentPage = index
        let image = UIImage(named: images[index])
        imageView.image = image
        nameLabel.text = btsName[index]
    }
}

