//
//  ViewController.swift
//  BTSImageViewer
//
//  Created by Chiwook Ahn on 3/11/25.
//

import UIKit



class ViewController: UIViewController {

    let images = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    let names = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    var index = 0
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func prevButtonHandler(_ sender: UIButton)
    {
        if index > 0
        {
            index -= 1
            loadImage(index)
            infoLabel.text = names[index]
        }
        else
        {
            let alert = UIAlertController(title: "경고", message: "뒤로 갈 수 없습니다!", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
    }
    @IBAction func nextButtonHandler(_ sender: UIButton)
    {
        if index < 6
        {
            index += 1
            loadImage(index)
            infoLabel.text = names[index]
        }
        else
        {
//            infoLabel.text = "앞으로 갈 수 없습니다!"
//            infoLabel.textColor = .systemRed
//            index -= 1
            let alert = UIAlertController(title: "경고", message: "앞으로 갈 수 없습니다!", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    func loadImage( _ index: Int)
    {
        let image = UIImage(named: images[index])
        imageView.image = image
    }
}

