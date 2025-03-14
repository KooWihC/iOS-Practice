//
//  MainViewController.swift
//  QatarWorldCupNation
//
//  Created by Chiwook Ahn on 3/14/25.
//

import UIKit

class MainViewController: UITableViewController {

    let sectionTitles = nations.keys.sorted()
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let key = sectionTitles[section]
        return nations[key]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nation", for: indexPath)
        let key = sectionTitles[indexPath.section]
        
        if let nationList = nations[key] {
            let nation = nationList[indexPath.row]
            
            // Nation의 이름 설정 (예: tag 2로 지정된 UILabel)
            if let nameLabel = cell.viewWithTag(2) as? UILabel {
                nameLabel.text = nation.name
            }
            
            // Nation의 flag 이미지를 설정 (예: tag 1로 지정된 UIImageView)
            if let flagImageView = cell.viewWithTag(1) as? UIImageView {
                flagImageView.image = UIImage(named: nation.flag)
                flagImageView.contentMode = .scaleAspectFill
            }
        }
//        if let nationList = nations[key]
//        {
//            let nation = nationList[indexPath.row]
//            cell.textLabel?.text = nation.name
//        }
//        
//        if let flagView = cell.viewWithTag(1) as? UIImageView
//        {
//            let flagName = nation.flag
//            flagView.image = UIImage(named: flagName)
//        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return sectionTitles[section]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let targetVC = segue.destination as? NationViewController else { return }
        // Pass the selected object to the new view controller.
        guard let selected = tableView.indexPathForSelectedRow else { return }
        let sectionKey = sectionTitles[selected.section] // 예: ["A", "B", "C", ...]
            if let nationList = nations[sectionKey] {
                targetVC.nation = nationList[selected.row]
            }
    }

}
