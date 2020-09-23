//
//  WebVC.swift
//  HelloSwift
//
//  Created by songyang on 2018/11/30.
//  Copyright © 2018年 songyang. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController, WKNavigationDelegate{

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        
        self.loadURLRequest()
        
        self.view .addSubview(webView)
        
        // Do any additional setup after loading the view.
    }
    
    func loadURLRequest() {
        
        let url = URL(string: "https://www.baidu.com")
        let request = URLRequest(url: url!)
        self.webView.load(request)
        self.webView.navigationDelegate = self
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("开始加载调用")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("内容开始返回调用")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("加载完成调用")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("加载失败调用")
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
