//
//  MaskReminderApp.swift
//  MaskReminder
//
//  Created by Nilay Neeranjun on 11/8/20.
//

import SwiftUI
import MapKit
import UserNotifications

@main
struct MaskReminderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            SavedLocations(locationManager: locationManager)
                .environmentObject(ModelData())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //Configure Notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            print("Permission granted: \(granted)")
        }
        application.registerForRemoteNotifications()
        return true
    }
    
}
