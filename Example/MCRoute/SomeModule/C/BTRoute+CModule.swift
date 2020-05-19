//
//  MCRoute+CModule.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

import MCRoute


fileprivate let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String ?? ""

fileprivate let target_BModule = "CModule"


extension MCRoute {
    
    @objc public func CModuleViewController(_ params: [String:Any]) -> UIViewController {
        
        
        // 此处传入了错误的target
        let vc = perform("InvalidTarget", params: params, nameSpace: nameSpace, shouldCacheTarget: false)
      
        
        let web = WebViewController.init(params)
        
        // 此处替换为了网页
        guard vc != nil else {
            return web
        }
        
        if let vc2 = vc as? CModuleViewController {
            return vc2
        }else {
            return web
        }
    }
}



class Target_CModule: NSObject,RouteTargetProtocol {
    @objc func Action_ViewController(_ params: [String : Any]) -> UIViewController? {
        let vc = CModuleViewController()
        return vc
    }
}
