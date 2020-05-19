//
//  HomeViewController.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MCRoute

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        self.navigationItem.title = "MCRoute"
        
        
        tableView.frame = view.frame
        view.addSubview(tableView)
    }
    
    
    lazy var tableView: UITableView = {
        let tb = UITableView.init(frame: .zero, style: .plain)
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tb.delegate = self
        tb.dataSource = self
        return tb
    }()
    
    lazy var dataArray: [String] = [
        "模态跳转A模块",
        "导航跳转A模块",
        "自定义类别跳转A模块",
        "跳转B模块并传值",
        "跳转B模块并传一张不存在的图片 （错误处理）",
        "动态替换控制器（可结合接口做配置）",
        "不能加载的控制器用Web页面替换",
        "远程访问",
        "展示错误替代页面（动态配置）"
    ]
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            MCRoute.shared.presentAModuleViewController()
        case 1:
            MCRoute.shared.pushAModuleViewController()
        case 2:
            let vc = MCRoute.shared.AModuleViewController()
//            bt.push(to: vc, hidesBottomBarWhenPushed: false)
            
        case 3:
            let dict = ["content": "我是传过来的值"]
            let vc = MCRoute.shared.BModuleViewController(dict)
//            bt.push(to: vc, hidesBottomBarWhenPushed: false)
            
        case 4:
            let vc = MCRoute.shared.showImageInBModuleViewController(nil)
//            bt.push(to: vc, hidesBottomBarWhenPushed: false)
            
        case 5:
            if let vc = MCRoute.shared.perform("CModule", params: nil) {
//                bt.push(to: vc as! UIViewController, hidesBottomBarWhenPushed: false)
            }
            
        case 6:
            let dict = ["title": "网页", "url": "https://www.baidu.com"]
            let vc = MCRoute.shared.CModuleViewController(dict)
//            bt.push(to: vc, hidesBottomBarWhenPushed: false)
            
        case 7:
            
            let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String ?? ""
            let url = "test://\(nameSpace)/BModule?content=哈哈&title=传入的title"
            if let vc = MCRoute.shared.performActionWithUrlStr(url) {
//                bt.push(to: vc as! UIViewController, hidesBottomBarWhenPushed: false)
            }
            
        case 8:
            let vc = MCRoute.shared.loadErrorAModuleViewController()
//            bt.push(to: vc, hidesBottomBarWhenPushed: false)

        default:
            break
        }
    }
}
