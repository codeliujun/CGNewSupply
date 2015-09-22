//
//  FirstViewController.swift
//  CGSupply
//
//  Created by liujun on 15/9/18.
//  Copyright (c) 2015年 liujun. All rights reserved.
//

import UIKit

class FirstViewController: CGBaseController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var noDataView: UIView!
    
    var isNoData = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "主页"
        self.creatTableHeader()
        // Do any additional setup after loading the view.
    }
    
    func creatTableHeader() {
        
        let headerSuperView = UIView(frame: CGRectMake(0, 0, kScreenSize.width, 45))
        let headerView = CGMainHeaderView.view() as! CGMainHeaderView
        headerView.frame = headerSuperView.frame
        headerSuperView.addSubview(headerView)
        self.tableView.tableHeaderView = headerSuperView
        print("\(NSStringFromCGRect(headerView.frame))-----\(self.tableView.tableHeaderView?.frame))")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.isLogin == false {
            self.pushLoginVC()
        }else{
           self.getData()
            self.tableView.reloadData()
        }
    }
    
    func getData(){
        
        self.request(url: "SCM/splitorderlist", parameters: ["userid":self.userId,"pageindex":"1","pagesize":"20","status":"-1"], success: { (result:NSDictionary!) -> () in
            
            print("\(result)")
            
            }) { (failue:NSDictionary!) -> () in
                
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: DELEGATE
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 1
        if isNoData == true {
            count = 1
        }else{
            count = 10
        }
        return count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        if isNoData {
            let cell = CGNoDataCell.cell() as! CGNoDataCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }else {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "13ws")
        cell.backgroundColor = UIColor.redColor()
        return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height = 44.0
        if isNoData == true {
            height = kScreenSize.height.native-64.0-45.0-84.0
        }
        return CGFloat(height);
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
