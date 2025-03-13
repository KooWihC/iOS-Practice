//
//  ViewController.swift
//  TableViewTestWithAcc
//
//  Created by 이다은 on 3/13/25.
//  Studied by Chiwook Ahn on 3/13/25.
// Accessory View

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }


}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paper", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = "\(indexPath.row)번째 row"
        cell.contentConfiguration = config
        
        
        switch indexPath.row % 5 {
        case 0 : cell.accessoryType = .checkmark
        case 1 : cell.accessoryType = .detailButton
        case 2 : cell.accessoryType = .detailDisclosureButton
        case 3 : cell.accessoryType = .disclosureIndicator
        case 4 : cell.accessoryType = .none
        default : cell.accessoryType = .none
        }
        return cell
    }
}
