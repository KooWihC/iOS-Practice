//
//  BTSTableViewController.swift
//  BTSNavigationController
//
//  Created by Chiwook Ahn on 3/14/25.
//

import UIKit

class BTSTableViewController: UITableViewController {

    let bts = [["nick":"RM", "image":"bts1", "desc":"1번째 멤버", "name":"김남준"],
               ["nick":"진", "image":"bts2", "desc":"2번째 멤버", "name":"김석진"],
               ["nick":"슈가", "image":"bts3", "desc":"3번째 멤버", "name":"민윤기"],
               ["nick":"제이홉", "image":"bts4", "desc":"4번째 멤버", "name":"정호석"],
               ["nick":"지민", "image":"bts5", "desc":"5번째 멤버", "name":"박지민"],
               ["nick":"뷔", "image":"bts6", "desc":"6번째 멤버", "name":"김태형"],
               ["nick":"정국", "image":"bts7", "desc":"7번째 멤버", "name":"전정국"]]
    
    var members: [BTS] = []
    
    func initData()
    {
        for member in bts
        {
            if let nick = member["nick"],
               let image = member["image"],
               let desc = member["desc"],
               let name = member["name"]
            {
                let btsMember = BTS(nick: nick, image: image, desc: desc, name: name)
                members.append(btsMember)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        //guard let member = members else { return }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return members.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        120
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BTS", for: indexPath)
        let member = members[indexPath.row]
        //viewWithTag 함수 - 내가 tag 번호를 지정한 것을 찾아줌 , optional 반환, 언래핑(if let)을 해서 nil이 아닌 것이 확실 - imageView1은 optioanl이 아님
        //as - 다운 캐스팅? 바꾸고 싶은 view로 바꿔줌
        if let imageView1 = cell.viewWithTag(1) as? UIImageView
        {
            let imageName = member.image
            imageView1.image = UIImage(named: imageName)
        }
        
        if let lblNick = cell.viewWithTag(2) as? UILabel
        {
            lblNick.text = member.nick
            lblNick.textColor = .purple
            lblNick.font = .systemFont(ofSize: 30)
        }
        
        if let lblName = cell.viewWithTag(3) as? UILabel
        {
            lblName.text = member.name
            lblName.textColor = .black
            lblName.font = .systemFont(ofSize: 20)
        }
        
        
        if let lblDesc = cell.viewWithTag(4) as? UILabel
        {
            lblDesc.text = member.desc
            lblDesc.textColor = .gray
            lblDesc.font = .systemFont(ofSize: 20)
        }
        
        let imgLogo = cell.viewWithTag(5) as? UIImageView
        imgLogo?.image = UIImage(named: "bts-icon")
        
        return cell
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        guard let targetVC = segue.destination as? MemberViewController else { return }
        // Pass the selected object to the new view controller.
        guard let selected = tableView.indexPathForSelectedRow else { return }
//        targetVC.nick = members[selected.row].nick
//        targetVC.imageName = members[selected.row].image
        targetVC.member = members[selected.row]
    }
    

}
