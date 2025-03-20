//
//  WebViewController.swift
//  MapViewTest
//
//  Created by Chiwook Ahn on 3/20/25.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

        var urlString: String?
        @IBOutlet weak var webView: WKWebView!

        override func viewDidLoad() {
            super.viewDidLoad()

            if let urlString = urlString, let url = URL(string: urlString)
            {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
