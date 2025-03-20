//
//  ViewController.swift
//  WebViewTest
//
//  Created by Chiwook Ahn on 3/20/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "http://127.0.0.1:8080"
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
//        if let url = URL(string: "https://www.daum.net")
//        {
//            let request = URLRequest(url: url)
//            webView.load(request)
//        }
    }

    @IBAction func naverBtn(_ sender: Any)
    {
        guard let url = URL(string: "https://www.naver.com") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @IBAction func daumBtn(_ sender: Any)
    {
        guard let url = URL(string: "https://www.daum.net") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @IBAction func googleBtn(_ sender: Any)
    {
        guard let url = URL(string: "https://www.google.com") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

