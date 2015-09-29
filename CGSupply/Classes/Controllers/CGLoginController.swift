//
//  CGLoginController.swift
//  CGSupply
//
//  Created by liujun on 15/9/20.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

class CGLoginController: CGBaseController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let loginCell = CGLoginCell.cell() as! CGLoginCell
    
    var phone           : String!
    var pwd             : String!
    var isRemember      : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        self.writeCell();
        self.cellEvent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeCell() {
        
        //获取信息
        let info = CGCache.getLoginInfo()
        
        if  info == nil  {
            return
        }
        
        let phone = info!["phone"] as! String
        let pwd = info!["pwd"] as! String
        let isRemember = info!["isRemember"]?.boolValue
        
        loginCell.phoneTextField.text = phone
        loginCell.pwdTextField.text = pwd
        loginCell.rememberPwd.selected = isRemember!
        
    }
    
    func cellEvent() {
        
        loginCell.didTapLoginButton { (pramar:(phone:String,pwd:String), isRememberPwd:Bool) -> () in
            self.phone = pramar.phone
            self.pwd = pramar.pwd
            self.isRemember = isRememberPwd
            //print("\(self.phone)----\(self.pwd)---\(self.isRemember)")
            self.Login()
        }
        
    }
    
    func Login() {
        
        self.request(url: "User/login", parameters: ["username":self.phone,"pwd":self.pwd,"logintype":"0"], success: { (results:NSDictionary!) -> () in
           
            //登录成功，保存账号密码
            self.saveLoginInfo()
            print("\(results)")
            let userData = results["Data"]
            //转换成实例
            CGConfigObj.shareConfig().userObj = CGUserObj(keyValues: userData)
            //print("\(CGConfigObj.shareConfig().userObj?.Id)")
           self.navigationController?.popViewControllerAnimated(true)
            }) { (failue) -> () in
                
        }
        
    }
    
    func saveLoginInfo() {
        let rem =  NSNumber(bool: self.loginCell.rememberPwd.selected)
        CGCache.saveLoginInfo(info: ["phone":self.phone,"pwd":self.pwd,"isRemember":rem])
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        loginCell.backgroundColor = UIColor.clearColor()
        loginCell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return loginCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return loginCell.bounds.height;
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView();
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
