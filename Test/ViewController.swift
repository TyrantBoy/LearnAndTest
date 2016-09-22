//
//  ViewController.swift
//  Test
//
//  Created by Donald Nguyen on 9/17/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //FBSDKAppEvents.activateApp()
        
        if(FBSDKAccessToken.current() == nil) {
            print("not login \n \n \n")
        } else {
            print("login \n \n \n")
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

