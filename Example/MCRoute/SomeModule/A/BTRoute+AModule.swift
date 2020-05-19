//
//  MCRoute+AModule.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MCRoute

fileprivate let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String ?? ""

fileprivate let target_AModule = "AModule"


extension MCRoute {
    
    
    @objc public func presentAModuleViewController() {
        let vc = perform(target_AModule, params: nil, nameSpace: nameSpace, shouldCacheTarget: false)
        
        if let vc2 = vc as? AModuleViewController {
            UIApplication.shared.keyWindow?.rootViewController?.present(vc2, animated: true, completion: nil)
        }
    }
    
    @objc public func pushAModuleViewController() {
        let vc = perform(target_AModule, params: nil, nameSpace: nameSpace, shouldCacheTarget: false)

//        if let vc2 = vc as? AModuleViewController {
            // 做push跳转
//            UIViewController.bt.current().bt.push(to: vc2, hidesBottomBarWhenPushed: false)
//        }
    }
    
    
    @objc public func AModuleViewController() -> UIViewController {
        let vc = perform(target_AModule, params: nil, nameSpace: nameSpace, shouldCacheTarget: false)
        guard vc != nil else {
            return errorController()
        }
        
        if let vc2 = vc as? AModuleViewController {
            return vc2
        }else {
            return errorController()
        }
    }
    
    
    @objc public func loadErrorAModuleViewController() -> UIViewController {
        let vc = perform("error", params: nil, nameSpace: nameSpace, shouldCacheTarget: false)
        guard vc != nil else {
            return errorController()
        }
        
        if let vc2 = vc as? AModuleViewController {
            return vc2
        }else {
            return errorController()
        }
    }
}



class Target_AModule: NSObject,RouteTargetProtocol {
    @objc func Action_ViewController(_ params: [String : Any]) -> UIViewController? {
        let vc = AModuleViewController()
        return vc
    }
}

