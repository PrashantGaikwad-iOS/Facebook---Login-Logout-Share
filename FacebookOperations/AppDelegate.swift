//
//  AppDelegate.swift
//  FacebookOperations
//
//  Created by Prashant G on 8/2/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit

import FBSDKLoginKit

/*
 // https://www.simplifiedios.net/facebook-login-swift-3-tutorial/
 // https://developers.facebook.com/docs/facebook-login/ios
 
 // App ID: 493244844472484
 
 <key>CFBundleURLTypes</key>
 <array>
 <dict>
 <key>CFBundleURLSchemes</key>
 <array>
 <string>fb493244844472484</string>
 </array>
 </dict>
 </array>
 <key>FacebookAppID</key>
 <string>493244844472484</string>
 <key>FacebookDisplayName</key>
 <string>MyFirstApp</string>
 
 <key>LSApplicationQueriesSchemes</key>
 <array>
 <string>fbapi</string>
 <string>fb-messenger-share-api</string>
 <string>fbauth2</string>
 <string>fbshareextension</string>
 </array>
*/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    
    var window: UIWindow?

    //added these 3 methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
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
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

