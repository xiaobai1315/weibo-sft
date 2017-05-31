//
//  HJTabBar.swift
//  weibo-sft
//
//  Created by Jermy on 2017/5/31.
//  Copyright © 2017年 Jermy. All rights reserved.
//
// 自定义的tabbar，中间增加'添加'按钮

import UIKit

class HJTabBar: UITabBar {

    //
    lazy var addBtn : UIButton = {
        
        var btn : UIButton = UIButton(type: UIButtonType.custom)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_cancel"), for: UIControlState.highlighted)
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        
        btn.addTarget(self, action: #selector(addBtnClick), for: UIControlEvents.touchUpInside)
        
        return btn
    }()
    
    //重写layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //取出tabbar的子控件，如果是 UITabBarButton类型，修改frame
        
        let btnW : Double = Double(self.frame.size.width / 5.0)
        let btnH : Double = Double(self.frame.size.height)
        
        var index : Double = 0.0
        
        for btn in self.subviews {
            
            //如果不是UITabBarButton类型，继续循环
            if !btn.isKind(of: NSClassFromString("UITabBarButton")!) {
                
                continue
            }
            
            //修改btn 的frame
            var btnX : Double = index * btnW
            
            if index >= 2.0 {
                btnX += btnW
            }
            
            btn.frame = CGRect(x: btnX, y: 0, width: btnW, height: btnH)
            
            index += 1.0
        }
        
        addBtn.frame = CGRect(x: btnW * 2, y: 0, width: btnW, height: btnH)
        self.addSubview(addBtn)
        
    }
    
    //MARK:- 添加按钮点击事件
    func addBtnClick() -> Void {
        print("add btn click")
    }

}
