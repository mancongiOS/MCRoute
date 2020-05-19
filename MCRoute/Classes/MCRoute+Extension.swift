//
//  MCRoute+Extension.swift
//  BTNameSpace
//
//  Created by MC on 2020/5/9.
//

import Foundation




extension MCRoute {
    
    //MARK: 初始化window
    @discardableResult
    public func configWindow(_ rootController: UIViewController? = nil) -> UIWindow {
        window = UIWindow(frame: UIScreen.main.bounds)
        if rootController == nil {
            window!.rootViewController = defultRootController
        }else{
            window!.rootViewController = rootController
        }
        window?.backgroundColor = UIColor.white
        window!.makeKeyAndVisible()
        return window!
    }
    
    public func configRootController(_ controller: UIViewController) {
        defultRootController = controller
    }
    
    //根控制器
    public func rootController(_ controller: String? = nil) {
        UIApplication.shared.keyWindow?.rootViewController = defultRootController
    }
    
    //配置错误控制器
    public func configErrorController(_ errorView: UIView) {
        tempErrorView = errorView
    }
    
    //获取错误控制器
    public func errorController() -> MCErrorViewController {
        let evc = MCErrorViewController()
        evc.errorView = errorView
        return evc
    }
    
    
}
