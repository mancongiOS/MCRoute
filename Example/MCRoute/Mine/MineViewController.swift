//
//  MineViewController.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.title = "我的"
        view.backgroundColor = UIColor.yellow
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tabBarController?.selectedIndex = 0
    }
}
