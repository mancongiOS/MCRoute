//
//  MCErrorViewController.swift
//  MCRoute
//
//  Created by MC on 2020/5/8.
//

import UIKit


public class MCErrorViewController: UIViewController {
    
    var errorView : UIView? = nil
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        if errorView != nil {
            self.view .addSubview(errorView!)
        }
    }
}
