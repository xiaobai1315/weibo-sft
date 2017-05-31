//
//  UIBarButtonItem+Extension.swift
//  weibo-sft
//
//  Created by lulu on 2017/5/31.
//  Copyright © 2017年 Jermy. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem{
    
    class func createBarButton(title : String, image : NSString, target : Any, selector : Selector) -> UIBarButtonItem{
        
        let leftBtn : UIButton = UIButton(type: UIButtonType.custom)
        
        if (title as NSString).length > 0{
            leftBtn .setTitle(title, for: UIControlState.normal)
        }
        
        if !image.isEqual(to: "") {
            
            leftBtn.setImage(UIImage(named: image as String), for: UIControlState.normal)
            leftBtn.setImage(UIImage(named: ((image as String) + "_highlighted")), for: UIControlState.highlighted)
        }
        
        
        leftBtn.sizeToFit()

        leftBtn.addTarget(target, action: selector, for: UIControlEvents.touchUpInside)
        
        return UIBarButtonItem(customView: leftBtn)

    }
}
