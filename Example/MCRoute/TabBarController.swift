//
//  TabBarController.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MCRoute


class TabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor.white
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewControllers = subControllers()
        delegate = self
        selectedIndex = 0
        tabBar.barTintColor = UIColor.white
    }
    
    private func subControllers() -> [UIViewController] {
        let home = MCRoute.shared.HomeViewController()

        let mine = MCRoute.shared.MineViewController()
        

        let homeNav = UINavigationController.init(rootViewController: home)
        homeNav.tabBarItem = setupItem("首页", "TabbarHome", "TabbarHomeHover")

        let mineNav = UINavigationController.init(rootViewController: mine)
        mineNav.tabBarItem = setupItem("我的", "TabbarMe", "TabbarMeHover")

        return [homeNav, mineNav]
    }
    
    private func setupItem(_ title: String, _ image: String, _ selectedImage: String) -> UITabBarItem {
        let item = UITabBarItem(title: title, image: UIImage(named: image)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal))
        item.setTitleTextAttributes([.foregroundColor : UIColor.gray], for: .normal)
        item.setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
        return item
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
