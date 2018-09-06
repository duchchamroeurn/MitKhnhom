//
//  MainVC.swift
//  MitKhnhom
//
//  Created by iOSDev on 6/9/18.
//  Copyright © 2018 iOSDev. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        title = "Main Screen"
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: true)
    }
    
    @objc private func logout() {
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        AppDelegate.share.rootViewController.switchToLogout()
    }
    
}
