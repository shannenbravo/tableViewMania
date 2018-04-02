//
//  AppDelegate.swift
//  tryingATableview
//
//  Created by Shannen Bravo-Brown on 3/7/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //create a uiwindow
        window = UIWindow()
        //make the window key and visable
        window?.makeKeyAndVisible()
        //create a navcontroller and set the root controller to the view controller
        let navController = UINavigationController(rootViewController: ViewController())
        //set the window root contoller to the nav controller 
        window?.rootViewController = navController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
 
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
       
    }

    func applicationWillTerminate(_ application: UIApplication) {
 
    }


}

