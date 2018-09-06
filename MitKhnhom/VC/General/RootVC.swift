//
//  RootVC.swift
//  MitKhnhom
//
//  Created by iOSDev on 6/9/18.
//  Copyright © 2018 iOSDev. All rights reserved.
//

import UIKit

class RootVC: UIViewController {
    
    private var current: UIViewController
    
    init() {
        self.current = SlashScreenVC()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParentViewController: self)
    }
    
    func showLoginScreen() {
        
        let new = LoginVC()//UINavigationController(rootViewController: LoginVC())
        addChildViewController(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParentViewController: self)
        current.willMove(toParentViewController: nil)
        current.view.removeFromSuperview()
        current.removeFromParentViewController()
        current = new                                 
    }
    
    func switchToMainScreen() {
        let mainViewController = MainVC()
        let new = UINavigationController(rootViewController: mainViewController)
        animateFadeTransition(to: new)
    }
    
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParentViewController: nil)
        addChildViewController(new)
        
        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {
        }) { completed in
            self.current.removeFromParentViewController()
            new.didMove(toParentViewController: self)
            self.current = new
            completion?()
        }
    }
    
    func switchToLogout() {
        let loginViewController = LoginVC()
        //let logoutScreen = UINavigationController(rootViewController: loginViewController)
        animateDismissTransition(to: loginViewController)
    }
    
    private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParentViewController: nil)
        addChildViewController(new)
        transition(from: current, to: new, duration: 0.3, options: [], animations: {
            new.view.frame = self.view.bounds
        }) { completed in
            self.current.removeFromParentViewController()
            new.didMove(toParentViewController: self)
            self.current = new
            completion?()
        }
    }

}
