//
//  AppDelegate.swift
//  SparrowCodeE1
//
//  Created by Коцур Тарас Сергійович on 01.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    configureWindow()
    return true
  }
}

extension AppDelegate {

  private func configureWindow() {
    let window = UIWindow()
    let viewController = ViewController()
    
    window.rootViewController = viewController
    window.makeKeyAndVisible()
    self.window = window
  }
}

