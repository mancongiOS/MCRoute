//
//  AppDelegate+Extension.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MCRoute


extension AppDelegate {
    func configRoute() -> UIWindow? {
        
        let router = MCRoute.shared
        router.initRootController()
        return router.configWindow()
    }
}
