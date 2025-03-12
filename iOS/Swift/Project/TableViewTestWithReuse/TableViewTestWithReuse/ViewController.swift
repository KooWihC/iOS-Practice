//
//  ViewController.swift
//  TableViewTestWithReuse
//
//  Created by Chiwook Ahn on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "can", for: indexPath)
        
        tableView.deq
//        if cell == nil
//        {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "paper")
//        }
        
        var config = cell?.defaultContentConfiguration()
        config?.text = "section\(indexPath.section), \(indexPath.row)번째 row"
        cell?.contentConfiguration = config
        return cell
    }
    
}
