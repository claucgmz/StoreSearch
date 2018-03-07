//
//  AppDelegate.swift
//  StoreSearch
//
//  Created by Caludia Carrillo on 3/6/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions
    launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    customizeAppearance()
    return true
  }

  func customizeAppearance() {
    let barTintColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1)
    UISearchBar.appearance().barTintColor = barTintColor
    window?.tintColor = UIColor(red: 10/255, green: 80/255, blue: 80/255, alpha: 1)
  }
}
