//
//  CGCommonObject.swift
//  CGSupply
//
//  Created by liujun on 15/9/18.
//  Copyright (c) 2015年 liujun. All rights reserved.
//

import UIKit

class CGCommonObject: NSObject {
    
    
   
    static func prepareTabBars()-> UITabBarController {
        
        let commonObj = CGCommonObject();
        
        var tabBar = UITabBarController();
        
        let firstVC = FirstViewController();
        commonObj.setUpSubViewController(viewController: firstVC, image: UIImage(named:"main_n"),highlightImgage:UIImage(named:"main_h"), title: "主页", tabBar: &tabBar);
        
        let secondVC = SecondViewController();
        commonObj.setUpSubViewController(viewController: secondVC, image: UIImage(named:"my_n"),highlightImgage:UIImage(named:"my_h"), title: "个人中心", tabBar: &tabBar);
        
//        let thirdVC = ThirdViewController();
//        commonObj.setUpSubViewController(viewController: thirdVC, image: UIImage(named:"main_n"),highlightImgage:UIImage(named:"main_h"), title: "收藏", tabBar: &tabBar);
//        
//        let fourthVc = FourthViewController();
//        commonObj.setUpSubViewController(viewController: fourthVc, image: UIImage(named:"main_n"),highlightImgage:UIImage(named:"main_h"), title: "信息", tabBar: &tabBar);
        
        return tabBar
    }
    
    func setUpSubViewController(viewController viewController:UIViewController!, image:UIImage?,highlightImgage:UIImage?,title:String?, inout tabBar:UITabBarController) {
        
        let navi = UINavigationController(rootViewController: viewController)
        
        navi.tabBarItem.image = image
        navi.tabBarItem.selectedImage = highlightImgage
        navi.navigationItem.title = title;
        navi.tabBarItem.title = title
        
        tabBar.addChildViewController(navi)
    }
    
}
