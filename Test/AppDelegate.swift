//
//  AppDelegate.swift
//  Test
//
//  Created by Donald Nguyen on 9/17/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        if UserDefaults.standard.isFirstLaunched() {
            window?.rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "OnboardingPage") as! OnboardingPage
        } else {
            window?.rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "TabViewController1") as! TabViewController1
        }
        
        self.window?.makeKeyAndVisible()
        
        /*
         1. Deselect initial view controller checkmark in storyboard
         2. Create a new window with the size of the current window and set it as our main window
         3. Instantiate a storyboard that we can use to create our new initial view controller
         4. Instantiate our new initial view controller based on it's Storyboard ID
         5. Set our new window's root view controller as our the new controller we just initiated
         6. Make our new window visible
 */
        return true
    }

    private func application(application: UIApplication, openURL url: URL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url as URL!, sourceApplication: sourceApplication, annotation: annotation)
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        FBSDKAppEvents.activateApp()

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

