//
//  CGLoginCell.swift
//  CGSupply
//
//  Created by liujun on 15/9/21.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

typealias  DidLoginButtonBlock = (pramar:(phone:String,pwd:String),isRememberPwd:Bool)->()//cell的类型，还有就是是否记住密码

class CGLoginCell: CGBaseCell,UITextFieldDelegate,LIUCustomSwitchDelegate {
    
    //MARK: property
    
    @IBOutlet weak var inputSuperView: UIView!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var pwdTextField: UITextField!
    
    @IBOutlet weak var rememberPwd: UIButton!
    
    @IBOutlet weak var loginButton: CGButton!
    
    var customSwitch : LIUCustomSwitch!
    
    var didLoginButtonBlock : DidLoginButtonBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        creatSubUI()
    }
    
    override func creatSubUI() {
        
        self.inputSuperView.layer.cornerRadius = 5.0
        self.inputSuperView.layer.masksToBounds = true
        
        //self.phoneTextField.delegate = self
        self.pwdTextField.delegate = self
        
        //创建自定义Switch
        self.customSwitch = LIUCustomSwitch(frame: CGRect(x: kScreenSize.width-80, y: 183, width: 50, height: 25))
        self.customSwitch.delegate = self
        self.addSubview(self.customSwitch)
        
    }
    
    //MARK: switchDelegate
    func switchDidTapWithStatue(statue: Bool) {
        
        self.pwdTextField.secureTextEntry = !statue
    
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
//        if  textField == phoneTextField {
//            pwdTextField.becomeFirstResponder()
//        }
//        else {
            textField.resignFirstResponder()
//        }
        
        return true
        
    }
    
    func didTapLoginButton(block:(pramar:(phone:String,pwd:String),isRememberPwd:Bool)->()) {
        self.didLoginButtonBlock = block
    }
    
    @IBAction func rememberPwd(sender: UIButton) {
        sender.selected = !sender.selected
        
    }
    
    @IBAction func didLogin(sender: UIButton) {
        
        var phone : String!
        var pwd : String!
        if self.phoneTextField.text != nil && self.phoneTextField.text != "" {
            phone = self.phoneTextField.text
        }else{
            SVProgressHUD.showErrorWithStatus("请输入账号")
            return
        }
        
        if self.pwdTextField.text != nil && self.pwdTextField.text != "" {
            pwd = self.pwdTextField.text
        }else{
            SVProgressHUD.showErrorWithStatus("请输入密码")
            return
        }
        
        if  self.didLoginButtonBlock != nil {
            self.didLoginButtonBlock!(pramar: (phone,pwd),isRememberPwd: self.rememberPwd.selected)
        }
        
    }
}
