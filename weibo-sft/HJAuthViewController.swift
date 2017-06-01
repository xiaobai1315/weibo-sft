//
//  HJAuthViewController.swift
//  weibo-sft
//
//  Created by Jermy on 2017/6/1.
//  Copyright © 2017年 Jermy. All rights reserved.
//

import UIKit

class HJAuthViewController: UIViewController, UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //通过webView加载服务器访问请求页面
        let webView : UIWebView = UIWebView(frame: self.view.frame)
        webView.delegate = self
        
        self.view.addSubview(webView)
        
        guard let url : NSURL = NSURL(string: "https://api.weibo.com/oauth2/authorize?client_id=402791712&redirect_uri=https://api.weibo.com/oauth2/default.html") else {
            
            return
        }
        
        webView.loadRequest(URLRequest(url: url as URL))
        
    }

    //#MARK:- webView代理
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let requestUrl : String = (request.url?.absoluteString)!
        
        //是否是回调页面
        if !requestUrl.hasPrefix("https://api.weibo.com"){
            
            return false
        }
        
        let key = "code="
        
//        let range = (requestUrl as NSString).range(of: key)
        
        let code = requestUrl.substring(from: key.endIndex)
        
//        if range.length == 0{
//            return true
//        }
        
        
        
        return false
    }
    

}
