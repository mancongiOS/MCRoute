//
//  BrRouter+Extension.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MCRoute

extension MCRoute {
    func initRootController() {
        let view = ErrorView()
        configErrorController(view)
        
        let tabBar = TabBarController()
        configRootController(tabBar)
    }
}
