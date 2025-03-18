//
//  BTSTableViewController.swift
//  BTSApp
//
//  Created by Chiwook Ahn on 3/18/25.
//

import UIKit

class BTSTableViewController: UITableViewController {

    var bts: NSMutableArray?
    let fileName = "bts.plist"
    override func viewDidLoad() {
        super.viewDidLoad()
        let targetURL = urlForFileName(fileName)
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: targetURL.path())
        {
            guard let originURL = Bundle.main.url(forResource: fileName, withExtension: nil) else { return }
            do
            {
                try fileManager.copyItem(at: originURL, to: targetURL)
            }
            catch
            {
                print("복사 오류")
            }
        }
        print(targetURL)
        do
        {
            bts = try NSMutableArray(contentsOf: targetURL, error: ())
        }
        catch
        {
            print("파일을 여는데 실패했습니다.")
        }
        // bts = try? NSMutableArray(contentsOf: targetURL, error: ()) 이렇게 예외처리 할 수 있음
        // bts = try! NSMutableArray(contentsOf: targetURL, error: ()) 이렇게도 가능
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bts?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        guard let member = bts?[indexPath.row] as? [String:String] else { return cell }
     //   print(member)
        let imageView = cell.viewWithTag(1) as? UIImageView
        let nicklbl = cell.viewWithTag(2) as? UILabel
        let namelbl = cell.viewWithTag(3) as? UILabel
        let desclbl = cell.viewWithTag(4) as? UILabel
       
        if let imageName = member["image"]
        {
            imageView?.image = UIImage(named: imageName)
        }
        nicklbl?.text = member["nick"]
        namelbl?.text = member["name"]
        desclbl?.text = member["desc"]
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            bts?.removeObject(at: indexPath.row)
            do
            {
                try bts?.write(to: urlForFileName(fileName))
            }
            catch
            {
                print(error.localizedDescription)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            let newMember = ["nick":"ChiChi", "name":"안치욱", "desc":"8번째 멤버", "image":"default"]
            bts?.insert(newMember, at: indexPath.row)
            try? bts?.write(to: urlForFileName(fileName))
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath)
    {
        guard let temp = bts?[fromIndexPath.row] else { return }
        bts?.removeObject(at: fromIndexPath.row)
        bts?.insert(temp, at: to.row)
        try? bts?.write(to: urlForFileName(fileName))
    }
    

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
        // Pass the selected object to the new view controller.
        guard let indexPath = tableView.indexPathForSelectedRow, let targetVC = segue.destination as? MemberViewController else { return }
        
        let member = bts?[indexPath.row] as? [String:String]
        targetVC.member = member
    }
    

}
