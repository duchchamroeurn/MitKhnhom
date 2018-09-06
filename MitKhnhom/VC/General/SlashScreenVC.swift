//
//  SlashScreenVC.swift
//  MitKhnhom
//
//  Created by iOSDev on 6/9/18.
//  Copyright © 2018 iOSDev. All rights reserved.
//

import UIKit

class SlashScreenVC: UIViewController {
    
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        makeServiceCall()
    }
    
    private func makeServiceCall() {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.activityIndicator.stopAnimating()
            
            if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
                AppDelegate.share.rootViewController.switchToMainScreen()
            } else {
                AppDelegate.share.rootViewController.switchToLogout()
            }
        }
    }
}
