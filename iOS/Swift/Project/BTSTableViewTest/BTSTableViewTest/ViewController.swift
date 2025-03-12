//
//  ViewController.swift
//  BTSTableViewTest
//
//  Created by Chiwook Ahn on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let nicks = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    let names = ["김남준", "김석진", "민윤기", "정호석", "박지민", "김태형", "전정국"]
    let images = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nicks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "bts")
        
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "bts")
        }
        
        var config = cell?.defaultContentConfiguration()
        
        config?.text = nicks[indexPath.row]
        config?.textProperties.alignment = .center
        config?.textProperties.color = .systemGreen
        config?.textProperties.font.withSize(50)
        
        config?.secondaryText = names[indexPath.row]
        config?.secondaryTextProperties.alignment = .center
        config?.secondaryTextProperties.color = .black
        config?.secondaryTextProperties.font.withSize(25)
        
        config?.image = UIImage(named: images[indexPath.row])
        cell?.contentConfiguration = config
        
        return cell!
    }
}

