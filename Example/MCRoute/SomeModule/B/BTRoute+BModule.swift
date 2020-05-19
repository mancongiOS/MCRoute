//
//  MCRoute+BModule.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MCRoute

fileprivate let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String ?? ""

fileprivate let target_BModule = "BModule"


extension MCRoute {
    
    @objc public func BModuleViewController(_ params: [String:Any]) -> UIViewController {
        let vc = perform(target_BModule, params: params, nameSpace: nameSpace, shouldCacheTarget: false)
        guard vc != nil else {
            return errorController()
        }
        
        if let vc2 = vc as? BModuleViewController {
            return vc2
        }else {
            return errorController()
        }
    }

    
    
    @objc public func showImageInBModuleViewController(_ image: UIImage?) -> UIViewController {
        
        var params = [
            "bgColor": UIColor.white,
            "titleImage": image
        ]

        if image == nil {
            // 无图片的处理,
            let selImage = UIImage.init(named: "TabbarHomeHover")
            params["titleImage"] = selImage
        }
        
        
        let vc = perform(target_BModule, params: params as [String : Any], nameSpace: nameSpace, shouldCacheTarget: false)
        guard vc != nil else {
            return errorController()
        }
        
        if let vc2 = vc as? BModuleViewController {
            return vc2
        }else {
            return errorController()
        }
    }
}



class Target_BModule: NSObject,RouteTargetProtocol {
    @objc func Action_ViewController(_ params: [String : Any]) -> UIViewController? {
        let vc = BModuleViewController(params)
        return vc
    }
}
