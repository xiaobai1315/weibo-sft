//
//  HJRootViewController.swift
//  weibo-sft
//
//  Created by Jermy on 2017/5/31.
//  Copyright © 2017年 Jermy. All rights reserved.
//
//  程序跟层控制器

import UIKit

class HJRootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //添加子控制器
        addViewControllers()
        
        //设置tabbar字体颜色
        setupTabbarTitleColor()
        
        //自定义tabbar
        setupTabbar()
        
    }
    
    //MARK:- 添加子控制器
    func addViewControllers() -> Void {
        
        //首页
        setupVC(viewController: HJHomeTableViewController(), name: "首页", image: "tabbar_home", selectedImage: "tabbar_home_selected")
        
        //消息
        setupVC(viewController: HJMessageTableViewController(), name: "消息", image: "tabbar_message_center", selectedImage: "tabbar_message_center_selected")
        
        //发现
        setupVC(viewController: HJDiscoverTableViewController(), name: "发现", image: "tabbar_discover", selectedImage: "tabbar_discover_selected")
        
        //我
        setupVC(viewController: HJMeTableViewController(), name: "我", image: "tabbar_profile", selectedImage: "tabbar_profile_highlighted")
        
    }
    
    //设置viewcontroller的名称、图片
    func setupVC(viewController : UIViewController, name : String, image : String, selectedImage : String) -> Void {
        
        viewController.tabBarItem.title = name
        viewController.tabBarItem.image = UIImage(named: image);
        viewController.tabBarItem.selectedImage = UIImage(named: selectedImage)
        self.addChildViewController(UINavigationController(rootViewController: viewController))
    }
    
    
    //MARK:- 设置tabbarItem文字颜色
    func setupTabbarTitleColor() -> Void {
        let normalAttr : [String : Any] = [NSForegroundColorAttributeName : UIColor.black]
        UITabBarItem.appearance().setTitleTextAttributes(normalAttr, for: UIControlState.normal)
    }
    
    
    //自定义tabbar
    func setupTabbar() -> Void {
        
        self.setValue(HJTabBar(), forKey: "tabBar")
    }
    
    
}
