//
//  AppDelegate.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/20/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        /* PART 1 START */
        //get the notification center
        let center =  UNUserNotificationCenter.current()
        //create the content for the notification
        let content = UNMutableNotificationContent()
        content.title = "Snapchat"
        content.subtitle = ""
        content.body = "Use the app man"
        content.sound = UNNotificationSound.default()
        //notification trigger can be based on time, calendar or location
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval:5.0, repeats: false)
        //create request to display
        let request = UNNotificationRequest(identifier: "ContentIdentifier", content: content, trigger: trigger)
        //add request to notification center
        center.add(request) { (error) in
           if error != nil {
               print("error \(String(describing: error))")
           }
            print("success")
        }

        /* PART 1 FINISH */
    }
}

