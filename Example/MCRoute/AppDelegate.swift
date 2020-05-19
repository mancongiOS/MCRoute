//
//  AppDelegate.swift
//  MCRoute
//
//  Created by cong_man on 05/19/2020.
//  Copyright (c) 2020 cong_man. All rights reserved.
//

import UIKit
import MCRoute

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = configRoute()
        return true
    }



}

