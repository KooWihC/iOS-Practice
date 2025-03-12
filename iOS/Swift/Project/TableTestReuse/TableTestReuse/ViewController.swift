//
//  ViewController.swift
//  TableTestReuse
//
//  Created by Chiwook Ahn on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "can")
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "paper")
        }
        
        var config = cell?.defaultContentConfiguration()
        config?.text = "Hello"
        cell?.contentConfiguration = config
        
        return cell!
    }

}

