//
//  CGOrderDetailController.swift
//  CGSupply
//
//  Created by 刘俊 on 15/9/29.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

class CGOrderDetailController: UITableViewController {
    
    /*属性*/
    var dataInfo : NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "详情"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  0 == section {
            return 1
        }else {
            return 0
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if  0 == indexPath.section {
            let cell = tableView.dequeueReusableCellWithIdentifier("CGOrderHeaderCell", forIndexPath: indexPath) as! CGOrderHeaderCell
            cell.layoutContentWithInfo(dataInfo)
            cell.backgroundColor = UIColor.clearColor()
            // Configure the cell...
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CGOrderGoodCell", forIndexPath: indexPath)
            
            // Configure the cell...
            
            return cell
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       
        if  0 == indexPath.section {
            return 152.0
        }else {
            return 85.0
        }
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        
        return view
        
    }
    
    
}
