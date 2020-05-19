//
//  Route+Home.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MCRoute

fileprivate let target_Home = "Home"

extension MCRoute {
    
    /// 首页
    public func HomeViewController() -> UIViewController {
        let vc = perform(target_Home, params: nil, shouldCacheTarget: false)
        guard vc != nil else {
            return errorController()
        }
        
        if let vc2 = vc as? HomeViewController {
            return vc2
        }else {
            return errorController()
        }
    }
}


class Target_Home: NSObject,RouteTargetProtocol {
    @objc func Action_ViewController(_ params: [String : Any]) -> UIViewController? {
        let vc = HomeViewController()
        return vc
    }
}
