//
//  SGLoginViewController.swift
//  SwiftGG
//
//  Created by TangJR on 11/30/15.
//  Copyright © 2015 swiftgg. All rights reserved.
//

import UIKit

class SGLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    @IBAction func loginButtonTapped() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.showHomePage()
    }
    
    @IBAction func registerButtonTapped() {
        let registerController = SGRegisterViewController()
        let navigationController = UINavigationController(rootViewController: registerController)
        presentViewController(navigationController, animated: true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}