//
//  ErrorView.swift
//  MCRoute_Example
//
//  Created by MC on 2020/5/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class ErrorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
        label.text = "错误页面 替代页面"
        label.textColor = UIColor.red
        
        label.frame = CGRect.init(x: 0, y: 0, width: 400, height: 500)
        self.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
