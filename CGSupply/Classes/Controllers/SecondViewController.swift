//
//  SecondViewController.swift
//  CGSupply
//
//  Created by liujun on 15/9/18.
//  Copyright (c) 2015年 liujun. All rights reserved.
//

import UIKit

class SecondViewController: CGBaseController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let cellInfo = ["个人设置","推出账号"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="个人中心"
        self.creatHeaderView()
        // Do any additional setup after loading the view.
    }
    
    func creatHeaderView() {
        
        let headerSupperView = UIView(frame: CGRectMake(0, 0,kScreenSize.width , 200))
        self.tableView.tableHeaderView = headerSupperView
        let headerView = ZHUserCenterHeaderView.view() as! ZHUserCenterHeaderView
        headerView.frame = CGRectMake(0, 0, headerSupperView.bounds.size.width, headerSupperView.bounds.size.height)
        headerSupperView.addSubview(headerView)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: DELEGATE
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel!.text = cellInfo[indexPath.section]
        cell.accessoryType = .DisclosureIndicator
        cell.selectionStyle = .None
        return cell
    }

    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if  0 == indexPath.section {
            SVProgressHUD.showErrorWithStatus("报告老大！该功能正在努力发掘中.....")
        }
        if  1 == indexPath.section {
            
            let alert = UIAlertController(title: nil, message: "退出当前账号", preferredStyle: .Alert)
            let a1 = UIAlertAction(title: "取消", style:UIAlertActionStyle.Cancel, handler: nil)
            let a2 = UIAlertAction(title: "是的", style: UIAlertActionStyle.Destructive, handler: { (UIAlertAction) -> Void in
                self.logingOut()
            })
            
            alert.addAction(a1)
            alert.addAction(a2)
            
            self.presentViewController(alert, animated: true, completion: nil);
        }
    }
    
    func logingOut() {
        
        
        CGConfigObj.shareConfig().userObj?.Id = ""
        
        self.tabBarController?.selectedViewController = self.tabBarController?.viewControllers?.first
    
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
