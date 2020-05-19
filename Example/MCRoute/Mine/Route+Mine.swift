//
//  Route+Mine.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MCRoute

fileprivate let target_Mine = "Mine"

extension MCRoute {
    
    /// 个人中心
    public func MineViewController() -> UIViewController {
        let vc = perform(target_Mine, params: nil, shouldCacheTarget: false)
        guard vc != nil else {
            return errorController()
        }
        
        if let vc2 = vc as? MineViewController {
            return vc2
        }else {
            return errorController()
        }
    }
}


class Target_Mine: NSObject,RouteTargetProtocol {
    @objc func Action_ViewController(_ params: [String : Any]) -> UIViewController? {
        let vc = MineViewController()
        return vc
    }
}
