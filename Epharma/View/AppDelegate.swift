//
//  PushNotif.swift
//  Epharma
//
//  Created by Hervé Leka Ndombet on 2022-04-04.
//

import Foundation
import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func requestRegistration(){
            UNUserNotificationCenter
                .current()
                .getNotificationSettings { (settings) in
                print("Notification settings: \(settings)")
                guard settings.authorizationStatus == .authorized
                                else { return }
                            DispatchQueue
                .main
                .async { UIApplication.shared.registerForRemoteNotifications()
                    }
                }
        }
        
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
        let tokenParts = deviceToken.map { data -> String in
            let p = String(format: "%02.2hhx", data)
            print("part-> "+p)
            return p
        }
        let token = tokenParts.joined()
               print("Register Success Device Token: \(token)")
           }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error){
    print("Failed to register: \(error)")
    }
    
}
