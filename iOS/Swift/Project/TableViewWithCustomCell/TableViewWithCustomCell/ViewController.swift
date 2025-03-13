//
//  ViewController.swift
//  TableViewWithCustomCell
//
//  Created by 이다은 on 3/13/25.
//  Studied by Chiwook Ahn on 3/13/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let bts = ["진", "슈가", "제이홉", "정국", "지민", "RM", "뷔"]

    let bts2 = ["김석진", "민윤기", "정호석", "전정국", "박지민", "김남준", "김태형"]
    
    let images = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //viewWithTag 함수 - 내가 tag 번호를 지정한 것을 찾아줌 , optional 반환, 언래핑(if let)을 해서 nil이 아닌 것이 확실 - imageView1은 optioanl이 아님
        //as - 다운 캐스팅? 바꾸고 싶은 view로 바꿔줌
        if let imageView1 = cell.viewWithTag(1) as? UIImageView {
            let imageName = images[indexPath.row]
            imageView1.image = UIImage(named: imageName)
        }
        
        if let lblNick = cell.viewWithTag(2) as? UILabel {
            lblNick.text = bts[indexPath.row]
            lblNick.textColor = .blue
            lblNick.font = .systemFont(ofSize: 30)
        }
        
        let imgLogo = cell.viewWithTag(3) as? UIImageView
        imgLogo?.image = UIImage(named: "bts-icon")
        
        if let lblName = cell.viewWithTag(4) as? UILabel {
            lblName.text = bts2[indexPath.row]
            lblName.textColor = .brown
            lblName.font = .systemFont(ofSize: 20)
        }
        
        return cell
    }
}

