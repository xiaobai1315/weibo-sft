//
//  HJAuthViewController.swift
//  weibo-sft
//
//  Created by Jermy on 2017/6/1.
//  Copyright © 2017年 Jermy. All rights reserved.
//

import UIKit
import Alamofire

class HJAuthViewController: UIViewController {

    var webView : UIWebView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //通过webView加载服务器访问请求页面
        let webView : UIWebView = UIWebView(frame: self.view.frame)
        self.webView = webView
        webView.delegate = self
        
        self.view.addSubview(webView)
        
        guard let url : NSURL = NSURL(string: "https://api.weibo.com/oauth2/authorize?client_id=402791712&redirect_uri=https://api.weibo.com/oauth2/default.html") else {
            
            return
        }
        
        webView.loadRequest(URLRequest(url: url as URL))
        
    }
}

extension HJAuthViewController : UIWebViewDelegate{
    
    //#MARK:- webView代理
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        guard (request.url != nil) else {
            return true
        }
        
        /*
         1、请求登录页面
         "https://api.weibo.com/oauth2/authorize?client_id=402791712&redirect_uri=https://api.weibo.com/oauth2/default.html" 
         2、登录成功会访问 "https://api.weibo.com/oauth2/default.html?code=0ccfbe20fc4c2acbd9bf0d096187d5d5" ”code=“包含的是授权码
         3、
         */
        
        
        let requestUrl : String = (request.url?.absoluteString)!

        //不是授权回调页面，返回true
        if !requestUrl.hasPrefix("https://api.weibo.com/oauth2/default.html"){
            
            return true
        }

        //判断返回的授权码是否包含‘code=’字段
        let key = "code="
        
        print(requestUrl)
        
        let range = (requestUrl as NSString).range(of: key)
        if range.length == 0{
            print("授权失败")
            return false
        }
        
        //截取授权码
        let code = (requestUrl as NSString).substring(from: (range.location + range.length))
        
        if(code as NSString).length == 0{
            return false;
        }
        
        //获取accessToken
        
        
        return true
    }
    
    //获取AccessToken
    private func getAccessToken()->Void{
        
        let url : URL = URL(string: "")!
        let parameters : [String : Any] = ["foo" : "123"]
        
        
        Alamofire.request(url!, method: HTTPMethod.post, parameters: parameters, encoding: ParameterEncoding, headers: <#T##HTTPHeaders?#>)
        
    }
}
