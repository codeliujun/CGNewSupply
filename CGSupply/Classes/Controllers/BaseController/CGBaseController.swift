//
//  CGBaseController.swift
//  CGSupply
//
//  Created by liujun on 15/9/18.
//  Copyright (c) 2015年 liujun. All rights reserved.
//

import UIKit

class CGBaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kBackGroundColor
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func request(url url:String,parameters:NSDictionary!,success:((result:NSDictionary!)->())!,failue:((failue:NSDictionary!)->())!) {
        
        CGHTTPRequest().request(url: url, parameters: parameters, success: { (result:NSDictionary!) -> () in
            SVProgressHUD.dismiss()
            if success != nil {
                success(result:result)
            }
            
            }) { (failue:NSDictionary!) -> () in
                let str = failue["failue"] as! String
                SVProgressHUD.showErrorWithStatus(str)
        }
    }
    
    //MARK: 判断用户是否登录
    
    var isLogin : Bool!{
        
        get { if let user = CGConfigObj.shareConfig().userObj {
            
            if user.Id!.length() < 5 {
                return false
            }
            else {
                return true
            }
            
        }else {
            return false
            }
        }
    }
    
    //MARK: 调出登录界面
    func pushLoginVC() {
        
        let loginVC = CGLoginController()
        loginVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    //MARK: 用户id
    var userId : String! {
        get {
            let userObj = CGConfigObj.shareConfig().userObj
            if userObj == nil {
                return "meidenglu"
            }else {
                return userObj?.Id
            }
        }
    }
}
