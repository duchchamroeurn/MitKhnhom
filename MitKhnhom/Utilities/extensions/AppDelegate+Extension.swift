//
//  AppDelegate+Extension.swift
//  VTrustValuate
//
//  Created by iOSDev on 21/8/18.
//  Copyright © 2018 iOSDev. All rights reserved.
//
import UIKit

extension AppDelegate {
    
    static var share: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var rootViewController: RootVC {
        return window!.rootViewController as! RootVC
    }
    
}
