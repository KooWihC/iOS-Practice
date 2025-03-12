//
//  ViewController.swift
//  BTSTableViewWithDict
//
//  Created by Chiwook Ahn on 3/12/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let reuseIdentifier = "bts"
    let bts = [["name":"RM", "image":"bts1", "desc":"1번째 멤버"],
               ["name":"진", "image":"bts2", "desc":"2번째 멤버"],
               ["name":"슈가", "image":"bts3", "desc":"3번째 멤버"],
               ["name":"제이홉", "image":"bts4", "desc":"4번째 멤버"],
               ["name":"지민", "image":"bts5", "desc":"5번째 멤버"],
               ["name":"뷔", "image":"bts6", "desc":"6번째 멤버"],
               ["name":"정국", "image":"bts7", "desc":"7번째 멤버"]]
    
    var members: [BTS] = []
    
    func initData()
    {
        for member in bts
        {
            if let name = member["name"],
               let image = member["image"],
               let desc = member["desc"]
            {
                let btsMember = BTS(name: name, image: image, desc: desc)
                members.append(btsMember)
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        initData()
    }
    
    
    //TODO: - 구현 해야함
    func doSomething()
    {
        
    }
    //???: 반환값이 정수인가?
    func todoSomething()
    {
        
    }
    
    //FIXME: - 수정 해야함
    //!!!: 조심!
    func printSomething()
    {
        print("안농")
    }

    //MARK: - TableView Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        let member = members[indexPath.row]
        var config = cell?.defaultContentConfiguration()
        
        config?.text = member.name
        config?.secondaryText = member.desc
        config?.image = UIImage(named: member.image)
        config?.imageProperties.maximumSize = CGSize(width: 120, height: 80)
        
        cell?.contentConfiguration = config
        
        return cell!
    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "bts")
//        
//        if cell == nil
//        {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "bts")
//        }
//        
//        var config = cell?.defaultContentConfiguration()
//        let member = bts[indexPath.row]
//        config?.text = member["name"]
//        config?.textProperties.color = .systemPurple
//        config?.secondaryText = member["desc"]
//        
//        if let imageName = member["image"]
//        {
//            let image = UIImage(named: imageName)
//            config?.image = image
//        }
//        config?.imageProperties.maximumSize = CGSize(width: 100, height: 180)
//        
//        cell?.contentConfiguration = config
//        return cell!
//    }
    
}

