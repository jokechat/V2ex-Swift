//
//  LoginViewController.swift
//  V2ex-Swift
//
//  Created by huangfeng on 1/22/16.
//  Copyright © 2016 Fin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var backgroundImageView : UIImageView?
    var frostedView :UIVisualEffectView?
    var userNameTextField:UITextField?
    var passwordTextField:UITextField?
    var loginButton:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        self.backgroundImageView = UIImageView(image: UIImage(named: "32.jpg"))
        self.backgroundImageView!.frame = self.view.frame
        self.backgroundImageView!.contentMode = .ScaleToFill
        self.view.addSubview(self.backgroundImageView!)
        backgroundImageView!.alpha = 0
        
        frostedView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        frostedView!.frame = self.view.frame
        self.view.addSubview(frostedView!)
        
        let vibrancy = UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: .Dark))
        let vibrancyView = UIVisualEffectView(effect: vibrancy)
        vibrancyView.userInteractionEnabled = true
        vibrancyView.frame = frostedView!.frame
        frostedView!.contentView.addSubview(vibrancyView)
        
        let v2exLabel = UILabel()
        v2exLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 32)!;
        v2exLabel.text = "V2EX"
        vibrancyView.contentView.addSubview(v2exLabel);
        v2exLabel.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(vibrancyView)
            make.top.equalTo(vibrancyView).offset(40)
        }
        
        let v2exSummaryLabel = UILabel()
        v2exSummaryLabel.font = v2Font(13);
        v2exSummaryLabel.text = "创意者的工作社区"
        vibrancyView.contentView.addSubview(v2exSummaryLabel);
        v2exSummaryLabel.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(vibrancyView)
            make.top.equalTo(v2exLabel.snp_bottom).offset(2)
        }
        
        self.userNameTextField = UITextField()
        self.userNameTextField!.textColor = UIColor.whiteColor()
        self.userNameTextField!.backgroundColor = UIColor(white: 1, alpha: 0.1);
        self.userNameTextField!.font = v2Font(15)
        self.userNameTextField!.layer.cornerRadius = 3;
        self.userNameTextField!.layer.borderWidth = 0.5
        self.userNameTextField!.layer.borderColor = UIColor(white: 1, alpha: 0.8).CGColor;
        self.userNameTextField!.placeholder = "        用户名"
        self.userNameTextField!.clearButtonMode = .Always
        
        vibrancyView.contentView.addSubview(self.userNameTextField!);
        
        self.userNameTextField!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(v2exSummaryLabel.snp_bottom).offset(25)
            make.centerX.equalTo(vibrancyView)
            make.width.equalTo(300)
            make.height.equalTo(38)
        }

        self.passwordTextField = UITextField()
        self.passwordTextField!.textColor = UIColor.whiteColor()
        self.passwordTextField!.backgroundColor = UIColor(white: 1, alpha: 0.1);
        self.passwordTextField!.font = v2Font(15)
        self.passwordTextField!.layer.cornerRadius = 3;
        self.passwordTextField!.layer.borderWidth = 0.5
        self.passwordTextField!.layer.borderColor = UIColor(white: 1, alpha: 0.8).CGColor;
        self.passwordTextField!.placeholder = "        密码"
        self.passwordTextField!.clearButtonMode = .Always
        
        vibrancyView.contentView.addSubview(self.passwordTextField!);
        
        self.passwordTextField!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.userNameTextField!.snp_bottom).offset(15)
            make.centerX.equalTo(vibrancyView)
            make.width.equalTo(300)
            make.height.equalTo(38)
        }
        
        self.loginButton = UIButton();
        self.loginButton!.setTitle("登  录", forState: .Normal)
        self.loginButton!.titleLabel!.font = v2Font(20)
        self.loginButton!.layer.cornerRadius = 3;
        self.loginButton!.layer.borderWidth = 0.5
        self.loginButton!.layer.borderColor = UIColor(white: 1, alpha: 0.8).CGColor;
        vibrancyView.contentView.addSubview(self.loginButton!);
        
        self.loginButton!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.passwordTextField!.snp_bottom).offset(20)
            make.centerX.equalTo(vibrancyView)
            make.width.equalTo(300)
            make.height.equalTo(38)
        }
        
        self.loginButton?.addTarget(self, action: Selector("loginClick:"), forControlEvents: .TouchUpInside)
        
        let forgetPasswordLabel = UILabel()
        forgetPasswordLabel.alpha = 0.5
        forgetPasswordLabel.font = v2Font(12)
        forgetPasswordLabel.text = "忘记密码了?"
        
        vibrancyView.contentView.addSubview(forgetPasswordLabel);
        
        forgetPasswordLabel.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.loginButton!.snp_bottom).offset(14)
            make.right.equalTo(self.loginButton!)
        }
        
        let footLabel = UILabel()
        footLabel.alpha = 0.5
        footLabel.font = v2Font(12)
        footLabel.text = "© 2016 Fin"
        
        vibrancyView.contentView.addSubview(footLabel);
        
        footLabel.snp_makeConstraints{ (make) -> Void in
            make.bottom.equalTo(vibrancyView).offset(-20)
            make.centerX.equalTo(vibrancyView)
        }
    }
    
    func loginClick(sneder:UIButton){
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(2) { () -> Void in
            self.backgroundImageView!.alpha=1;
        }
        UIView.animateWithDuration(20) { () -> Void in
            self.backgroundImageView?.frame = CGRectMake(-1*( 1000 - SCREEN_WIDTH )/2, 0, SCREEN_HEIGHT+500, SCREEN_HEIGHT+500);
        }
    }
    
}
