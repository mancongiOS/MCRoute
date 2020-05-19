//
//  MCRoute.swift
//  MCRoute
//
//  Created by MC on 2020/5/8.
//

import Foundation


import UIKit

fileprivate var Route_NameSpace = ""



public protocol RouteTargetProtocol {
    func Action_ViewController(_ params: [String:Any]) -> UIViewController?
}


public protocol RouteProtocol where Self : UIViewController {
    init(_ dict:[String:Any])
}

extension RouteProtocol {
    public init(_ dict:[String:Any]) {
        self.init()
    }
}




public class MCRoute: NSObject {
    
    static public let shared = MCRoute.init()
    private override init(){}
    
    
    public var window : UIWindow? = nil
    public var errorView: UIView? {
        get {
            return tempErrorView
        }
    }
    private lazy var cachedTarget: [String:Any] = {
        return [String:Any]()
    }()
    
    internal var tempErrorView: UIView? = nil
    internal var defultRootController : UIViewController? = nil
}



extension MCRoute {
    
    
    /// 根据名称调用模块
    /// - Parameters:
    ///   - targetName: 目标名称
    ///   - params: 携带参数
    ///   - nameSpace: 命名空间名称
    ///   - shouldCacheTarget: 是否缓存
    public func perform(_ targetName: String,
                        params: [String: Any]?,
                        nameSpace:String = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String ?? "",
                        shouldCacheTarget: Bool = false) -> Any? {
        
        
        Route_NameSpace = nameSpace
        
        let targetClassString = nameSpace + "." + "Target_" + targetName
        let actionString = "Action_ViewController:"
        var target : NSObject? = cachedTarget[targetClassString] as? NSObject
        if target == nil {
            guard let targetClass = NSClassFromString(targetClassString) as? NSObject.Type else {
                return nil
            }
            target = targetClass.init()
        }
        
        var newAction = NSSelectorFromString(actionString)
        
        if shouldCacheTarget == true {
            cachedTarget[targetClassString] = target
        }
        
        if target!.responds(to: newAction) {
            return target?.perform(newAction, with: params).retain().takeRetainedValue()
        }else {
            newAction = NSSelectorFromString("notFound:")
            if target!.responds(to: newAction) {
                // 这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理
                return target?.perform(newAction, with: params).retain().takeRetainedValue()
            }else {
                // 这里也是处理无响应请求的地方
                cachedTarget.removeValue(forKey: targetClassString)
                return nil
            }
        }
    }
}

extension MCRoute {
    
    
    /// 根据网络url调用本地模块
    /// - Parameter urlStr: 路径 scheme//:命名空间名称/模块名称?参数=123
    @objc public func performActionWithUrlStr(_ urlStr: String) -> Any? {
        
        var encodeStr = urlStr
        
        if judgeStringIncludeChineseWord(string: urlStr) {
            
            if let temp = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                encodeStr = temp
            }
        }
                
        guard let url = URL.init(string: encodeStr) else {
            return nil
        }
        
        var params: [String: Any] = [:]

        guard let urlString = url.query else {
            return nil
        }
        
        for param in urlString.components(separatedBy: "&") {
            let elts = param.components(separatedBy: "=")
            if elts.count < 2 { continue }
            params.updateValue(elts.last as Any, forKey: elts.first!)
        }

        // 这里这么写主要是出于安全考虑，防止黑客通过远程方式调用本地模块。
        //这里的做法足以应对绝大多数场景，如果要求更加严苛，也可以做更加复杂的安全逻辑。
        let actionName = url.path.replacingOccurrences(of: "/", with: "")
        
        /// native 是原生模块的前缀。可自定义
        if actionName.hasPrefix("native") {
            return nil
        }
                
        let nameSpace = url.host ?? ""
        
        // 针对URL的路由处理非常简单，就只是取对应的target名字和method名字.
        // 但这已经足以应对绝大部份需求。如果需要拓展，可以在这个方法调用之前加入完整的路由逻辑
        let result = self.perform(actionName, params: params, nameSpace: nameSpace, shouldCacheTarget: false)
                
        return result
    }
}




extension MCRoute {
    func releaseCacheTarget(_ targetName: String) {
        let targetClassString = Route_NameSpace + "." + "Target_" + targetName
        cachedTarget.removeValue(forKey: targetClassString)
    }
}



fileprivate func judgeStringIncludeChineseWord(string: String) -> Bool {
    
    for (_, value) in string.enumerated() {

        if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
            return true
        }
    }
    
    return false
}
