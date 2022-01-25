//
//  AppDelegate.swift
//  QSViewReuse
//
//  Created by Song on 2020/7/9.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.qs_setRootViewController(rootVc: ViewController())
        
        return true
    }

    /**
     *  设置根控制器
     */
    func qs_setRootViewController(rootVc : UIViewController) -> Void {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        self.window?.rootViewController = rootVc
        self.window?.makeKeyAndVisible()
    }
}

