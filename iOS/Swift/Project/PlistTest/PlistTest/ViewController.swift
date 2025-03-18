//
//  ViewController.swift
//  PlistTest
//
//  Created by Chiwook Ahn on 3/17/25.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    var bts: NSArray?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //let path = Bundle.main.path(forResource: "BTS", ofType: "plist")
//        guard let url = Bundle.main.url(forResource: "BTS", withExtension: "plist") else { return }
////        print(url ?? "")
////        print(path ?? "")
//        do
//        {
//            bts = try NSArray(contentsOf: url, error: ())
//        } catch {
//            print("BTS.plist를 읽어오는 도중 예외발생")
//        }
//        print(bts)
//        
//    }
//
//
//}

import UIKit

class ViewController: UIViewController {
    var bts:NSArray?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tableView.dataSource = self
        
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = urls[0]
        print(docDir)
    }
    func initData()
    {
        guard let url = Bundle.main.url(forResource: "BTS", withExtension: "plist") else { return }
        let path = Bundle.main.path(forResource: "BTS", ofType: "plist")
        do {
            bts = try NSArray(contentsOf: url, error: ())
        } catch {
            print("BTS.plist를 읽어오는 도중 예외발생")
        }
    }
}

extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return bts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        
        guard let bts, let member = bts[indexPath.row] as? [String:String] else { return cell }
        var config = cell.defaultContentConfiguration()
        if let imageName = member["image"]
        {
            config.image = UIImage(named: imageName)
            config.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        }
        config.text = member["nick"]
        config.textProperties.font = .boldSystemFont(ofSize: 20)
        config.secondaryText = member["name"]
        config.secondaryTextProperties.color = .gray
        
        
        cell.contentConfiguration = config
        return cell
    }
}
