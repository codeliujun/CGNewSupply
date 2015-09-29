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
    
    var dataList : NSArray?
    
    var isNoData = true
    
    var status = "1006" //1006配送中心未配送订单，1007配送中心已配送订单，1008通过门店验收，流程结束
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "主页"
        self.creatTableHeader()
        tableView.registerNib(UINib(nibName:CGOrderCell.identify(), bundle: nil), forCellReuseIdentifier: CGOrderCell.identify())
        // Do any additional setup after loading the view.
    }
    
    func creatTableHeader() {
        
        let headerSuperView = UIView(frame: CGRectMake(0, 0, kScreenSize.width, 45))
        let headerView = CGMainHeaderView.view() as! CGMainHeaderView
        headerView.didChooseStatusBlock = { (status:SupplyOrderStatus)->() in
            
            switch status {
            case SupplyOrderStatus.willSendOrder:
                self.status = "1006"
                break
            case SupplyOrderStatus.didSendOrder:
                self.status = "1007"
                break
            case SupplyOrderStatus.errorOrder:
                self.status = "1008"
                break
//            default:
//                break
            }
            
            self.getData()
        };
        headerView.frame = headerSuperView.frame
        headerSuperView.addSubview(headerView)
        self.tableView.tableHeaderView = headerSuperView
        print("\(NSStringFromCGRect(headerView.frame))-----\(self.tableView.tableHeaderView?.frame))")
        
    }
    
    override func viewWillAppear(animated: Bool) {
       
        super.viewWillAppear(animated)
        
//        if self.isLogin == false {
//            self.pushLoginVC()
//        }else{
//            self.getData()
//            self.tableView.reloadData()
//        }
    }
    
    override func viewDidAppear(animated: Bool) {
        if self.isLogin == false {
            self.pushLoginVC()
        }else{
            self.getData()
            self.tableView.reloadData()
        }
    }
    
    func getData(){
        
        //weak var weakDataList = dataList
        self.request(url: "SCM/splitorderlist", parameters: ["userid":self.userId,"pageindex":"1","pagesize":"20","status":self.status], success: { (result:NSDictionary!) -> () in
            
            self.dataList = result["Data"] as? NSArray
            //print("\(self.dataList)")
            self.tableView.reloadData()
            
            }) { (failue:NSDictionary!) -> () in
                
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: DELEGATE
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if  dataList == nil || dataList?.count == 0 {
            isNoData = true
            return 1
        }else {
            isNoData = false
            return (dataList!.count)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 1
        //        if isNoData == true {
        //            count = 1
        //        }else{
        //            count = 10
        //        }
        return count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if isNoData {
            let cell = CGNoDataCell.cell() as! CGNoDataCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }else {
            let cell = tableView.dequeueReusableCellWithIdentifier(CGOrderCell.identify(), forIndexPath: indexPath) as! CGOrderCell
            cell.layoutConteWithInfo(dataList?[indexPath.section] as! NSDictionary) ;
            //cell.backgroundColor = UIColor.clearColor()
            return cell
        }
    }
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height = 115.0
        if isNoData == true {
            height = Double(kScreenSize.height.native)-64.0-45.0-84.0
        }
        return CGFloat(height);
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView();
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView();
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let orderDetail = UIStoryboard(name: "OrderDetail", bundle: nil).instantiateInitialViewController() as! CGOrderDetailController
        orderDetail.dataInfo = dataList?[indexPath.row] as! NSDictionary
        self.navigationController?.pushViewController(orderDetail, animated: true);
    }
    
}
