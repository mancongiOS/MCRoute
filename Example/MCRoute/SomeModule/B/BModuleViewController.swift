//
//  BModuleViewController.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/8.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class BModuleViewController: UIViewController {
    
    
    private var titleStr: String?
    private var content: String?
    private var titleImage: UIImage?
    
    
    @objc public init(_ dict: [String: Any]) {
        super.init(nibName: nil, bundle: nil)
        
        titleStr = dict["title"] as? String
        content = dict["content"] as? String
        titleImage = dict["titleImage"] as? UIImage
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        
        if titleStr != nil {
            title = titleStr?.removingPercentEncoding
        } else {
            title = "B Module"
        }
        
        
        view.backgroundColor = UIColor.orange
        
        view.addSubview(contentLabel)
        contentLabel.frame = CGRect.init(x: 0, y: 0, width: 300, height: 40)
        contentLabel.center = view.center
        
        // 解码操作
        let ecode = content?.removingPercentEncoding
        contentLabel.text = ecode
        
        titleImageView.image = titleImage
        view.addSubview(titleImageView)
        titleImageView.frame = CGRect.init(x: view.frame.size.width / 2 - 17, y: 120, width: 34, height: 42)
    }
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "这是私有库下的模块B"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    lazy var titleImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
}
