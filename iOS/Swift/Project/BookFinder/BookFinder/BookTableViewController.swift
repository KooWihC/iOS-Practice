//
//  BookTableViewController.swift
//  BookFinder
//
//  Created by Chiwook Ahn on 3/21/25.
//

import UIKit

class BookTableViewController: UITableViewController {

    @IBOutlet weak var rightBtn: UIBarButtonItem!
    @IBOutlet weak var leftBtn: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    let apiURL = "https://dapi.kakao.com/v3/search/book"
    var books : [[String:Any]]?
    var page = 1
    {
        didSet
        {
            leftBtn.isEnabled = page > 1
            searchWithQuery(searchBar.text, page: page)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func searchWithQuery(_ query:String?, page:Int)
    {
        guard let query else { return }
        let endPoint = "\(apiURL)?query=\(query)&page=\(page)"
        guard let url = URL(string: endPoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("KakaoAK cc445c2fdbcc7cc7a84b8ca216cecb59", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            guard let data else { return }
            let jsonObject = try? JSONSerialization.jsonObject(with: data) // jsonObject의 throws로 인해 예외처리
            guard let dic = jsonObject as? [String:Any] else { return }
            self.books = dic["documents"] as? [[String:Any]]
            
            if let meta = dic["meta"] as? [String:Any], let isEnd = meta["is_end"] as? Bool
            {
                DispatchQueue.main.async
                {
                    self.rightBtn.isEnabled = !isEnd
                }
            }
            DispatchQueue.main.async
            {
                self.tableView.reloadData()
            }
            //print(dic)
        }
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book", for: indexPath)
        guard let books else { return cell }
        let book = books[indexPath.row]
        let title = book["title"] as? String
        let publisher = book["publisher"] as? String
        let temp = book["authors"] as? [String]
        let authors = temp?.joined(separator: ", ")
        let price = book["price"] as? Int
        
        
        let imageView = cell.viewWithTag(1) as? UIImageView
        let titleLbl = cell.viewWithTag(2) as? UILabel
        let authorsLbl = cell.viewWithTag(3) as? UILabel
        let publisherLbl = cell.viewWithTag(4) as? UILabel
        let priceLbl = cell.viewWithTag(5) as? UILabel
        
        titleLbl?.text = title
        authorsLbl?.text = authors
        publisherLbl?.text = publisher
        if let price { priceLbl?.text = "\(price)원" }
        
        if let thumbnail = book["thumbnail"] as? String, let url = URL(string: thumbnail)
        {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _, _ in
                guard let data else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    imageView?.image = image
                }
            }
            task.resume()
        }
        

        return cell
    }
    
    @IBAction func prevBtn(_ sender: Any)
    {
        page -= 1
        //searchWithQuery(searchBar.text, page: page)
    }
    
    @IBAction func nextBtn(_ sender: Any)
    {
        page += 1
        //searchWithQuery(searchBar.text, page: page)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
//        if segue.identifier == "showWebView",
//           let webVC = segue.destination as? WebViewController,
//           let indexPath = tableView.indexPathForSelectedRow,
//           let book = books?[indexPath.row],
//           let urlString = book["url"] as? String
//        {
//            webVC.strURL = urlString
//        }
        
        let targetVC = segue.destination as? WebViewController
        guard let indexPath = tableView.indexPathForSelectedRow, let books else { return }
        let book = books[indexPath.row]
        targetVC?.strURL = book["url"] as? String
    }
    

}

extension BookTableViewController: UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        page = 1
        searchBar.resignFirstResponder()
    }
}
