//
//  LoginVC.swift
//  MitKhnhom
//
//  Created by iOSDev on 6/9/18.
//  Copyright © 2018 iOSDev. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let btnLogin = UIButton(frame: CGRect(x: 40, y: 100, width: self.view.frame.width - 80, height: 40))
        btnLogin.setTitle("LOGIN", for: .normal)
        btnLogin.backgroundColor = UIColor.blue
        btnLogin.addTarget(self, action: #selector(self.login), for: .touchDown)
        self.view.addSubview(btnLogin)
    }
    
    @objc private func login() {
        UserDefaults.standard.set(true, forKey: "LOGGED_IN")
        AppDelegate.share.rootViewController.switchToMainScreen()
    }
    
}
