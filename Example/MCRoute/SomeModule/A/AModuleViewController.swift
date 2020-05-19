//
//  ListViewController.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class AModuleViewController: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        title = "A Module"
        
        view.backgroundColor = UIColor.red
        
        view.addSubview(contentLabel)
        contentLabel.frame = CGRect.init(x: 0, y: 0, width: 300, height: 40)
        contentLabel.center = view.center
    }
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "这是私有库下的模块A"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
}
