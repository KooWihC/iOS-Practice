//
//  ViewController.swift
//  WebViewWithCom
//
//  Created by Chiwook Ahn on 3/20/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView: WKWebView?
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let config = WKWebViewConfiguration()
        let controller = WKUserContentController()
        controller.add(self, name: "SendMessage") // 누가 대신해 줄지 정하는거래 deligate처럼
        controller.add(self, name: "SayHello")
        controller.add(self, name: "SetUser")
        
        config.userContentController = controller
        webView = WKWebView(frame: self.view1.frame, configuration: config)
        guard let webView else { return }
        webView.uiDelegate = self
        self.view1.addSubview(webView)
        
        if let url = URL(string: "http://127.0.0.1:8080")
        {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    @IBAction func action1(_ sender: Any)
    {
        webView?.evaluateJavaScript("call_func1()")
    }
    @IBAction func action2(_ sender: Any)
    {
        let param = "Hello WebView"
        webView?.evaluateJavaScript("call_func2('\(param)')")
    }
    @IBAction func action3(_ sender: Any)
    {
        let info = ["name": "홍길동", "age": "26"]
        if let serializeData = try? JSONSerialization.data(withJSONObject: info),
           let encodedData = String(data: serializeData, encoding: .utf8)
        {
            let callStr = "call_func3('\(encodedData)')"
            webView?.evaluateJavaScript(callStr, completionHandler: { result, _ in
                if let result = result as? [String:String]
                {
                    print(result)
                }
            })
        }
    }
    

}

extension ViewController: WKScriptMessageHandler
{
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage)
    {
        print(message.name)
        
        if message.name == "SendMessage"
        {
            print(message.body)
            print("Recieve SendMessage")
        }
        else if message.name == "SayHello"
        {
            print("Recieve SayHello : \(message.body)")
        }
        else if message.name == "SetUser"
        {
            print(message.body)
            if let info = message.body as? [String:String]
            {
                print("Recieve SetUser : \(info["name"] ?? "")")
            }
        }
        else
        {
            
        }
    }
}

//class WebMessageHandler: NSObject, WKScriptMessageHandler
//{
//    
//}

extension ViewController: WKUIDelegate
{
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping @MainActor () -> Void)
    {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler()
        }
        alertController.addAction(actionOK)
        present(alertController, animated: true)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping @MainActor (Bool) -> Void)
    {
        let alert = UIAlertController(title: "컨펌", message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler(true)
        }
        let actionCancel = UIAlertAction(title: "취소", style: .cancel) { _ in
            completionHandler(false)
        }
        
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        
        present(alert, animated: true)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping @MainActor (String?) -> Void)
    {
        let alert = UIAlertController(title: "Prompt", message: prompt, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = defaultText
        }
        let actionOK = UIAlertAction(title: "완료", style: .default) { _ in
            if let input = alert.textFields?[0].text
            {
                completionHandler(input)
            }
            else
            {
                completionHandler(defaultText)
            }
        }
        
        alert.addAction(actionOK)
        present(alert, animated: true)
    }
}
