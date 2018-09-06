//
//  UIViewController+Extension.swift
//  VTrustValuate
//
//  Created by iOSDev on 16/7/18.
//  Copyright © 2018 iOSDev. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */
    
    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    class func displaySpinner(onView : UIView, isRefresh: Bool = false) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        if isRefresh == false {
            DispatchQueue.main.async {
                spinnerView.addSubview(ai)
                onView.addSubview(spinnerView)
            }
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
    
    public func customNavigationBackButton() {
        self.navigationItem.setHidesBackButton(true, animated:true)
        let backButtonImage = UIImage(named: "back")
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(self.backClick))
        backButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsetsMake(0, -15, 0, 0)
    }
    
    @objc func backClick() {
        self.navigationController?.popViewController(animated: true)
    }
}
