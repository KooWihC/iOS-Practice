//
//  ViewController.swift
//  TableViewTest1
//
//  Created by Chiwook Ahn on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        var config = cell.defaultContentConfiguration()
        config.text = "section\(indexPath.section + 1) row\(indexPath.row + 1)"
        cell.contentConfiguration = config
        return cell
    }
//    func numberOfSections(in tableView: UITableView) -> Int
//    {
//        <#code#>
//    }
}

