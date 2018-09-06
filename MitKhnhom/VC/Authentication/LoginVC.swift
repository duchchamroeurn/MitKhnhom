//
//  LoginVC.swift
//  MitKhnhom
//
//  Created by iOSDev on 6/9/18.
//  Copyright © 2018 iOSDev. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    let scrollView = TPKeyboardAvoidingScrollView()
    let scrollViewContent = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.setupUI()
    }
    
    @objc private func login() {
        UserDefaults.standard.set(true, forKey: "LOGGED_IN")
        AppDelegate.share.rootViewController.switchToMainScreen()
    }
    
    private func setupUI() {
        
        /// Label App title
        let lblAppName = UILabel(frame: CGRect(x: 40, y: 60, width: self.view.frame.width - 80, height: 60))
        lblAppName.text = "Mit Khnhom"
        lblAppName.textAlignment = .center
        lblAppName.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        scrollViewContent.addSubview(lblAppName)
        
        scrollView.frame = CGRect(x: 0, y: self.topbarHeight, width: self.view.bounds.width, height: self.view.bounds.height)
        scrollViewContent.frame = self.scrollView.bounds
        scrollView.addSubview(scrollViewContent)
        view.addSubview(scrollView)
    }
    
}
