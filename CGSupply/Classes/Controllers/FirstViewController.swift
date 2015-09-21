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
        }
        
        self.getData()
        
    }
    
    func getData(){
        
        self.request(url: <#T##String#>, parameters: <#T##NSDictionary!#>, success: <#T##((result: NSDictionary!) -> ())!##((result: NSDictionary!) -> ())!##(result: NSDictionary!) -> ()#>, failue: <#T##((failue: NSDictionary!) -> ())!##((failue: NSDictionary!) -> ())!##(failue: NSDictionary!) -> ()#>)
        
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
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "13ws")
        cell.backgroundColor = UIColor.redColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0;
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
