//
//  FirstViewController.swift
//  CGSupply
//
//  Created by liujun on 15/9/18.
//  Copyright (c) 2015年 liujun. All rights reserved.
//

import UIKit

class FirstViewController: CGBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "主页"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if self.isLogin == false {
            self.pushLoginVC()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
