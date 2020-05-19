//
//  WebViewController.swift
//  OCBridgeSwift
//
//  Created by MC on 2020/3/16.
//

import UIKit

import WebKit

@objc public class WebViewController: UIViewController {
    
    private var titleStr : String = ""
    private var url : String = ""

    
    init(_ dict:[String : Any]) {
        
        super.init(nibName: nil, bundle: nil)

        titleStr = dict["title"] as? String ?? ""
        url = dict["url"] as? String ?? ""

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.progressView.isHidden = false
        UIView.animate(withDuration: 1.0) {
            self.progressView.progress = 0.0
        }
        
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        baseSetting()
        initUI()
    }
    lazy var webView : WKWebView = {
        let web = WKWebView()
        let webUrl = self.url
        /// 设置访问的URL
        let url = NSURL(string: webUrl)
        /// 根据URL创建请求
        let requst = NSURLRequest(url: url! as URL)
        /// 设置代理
        //        web.uiDelegate = self
        web.navigationDelegate = self
        /// WKWebView加载请求
        web.load(requst as URLRequest)
        return web
    }()
    
    // 进度条
    lazy var progressView:UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = UIColor.black
        progress.trackTintColor = .clear
        return progress
    }()
}
extension WebViewController : WKNavigationDelegate {
    
    // 页面开始加载时调用
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        self.navigationItem.title = "加载中..."
        /// 获取网页的progress
        UIView.animate(withDuration: 0.5) {
            self.progressView.progress = Float(self.webView.estimatedProgress)
        }
    }
    // 当内容开始返回时调用
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        
    }
    // 页面加载完成之后调用
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        /// 获取网页title
        self.title = self.webView.title
        
        UIView.animate(withDuration: 0.5) {
            self.progressView.progress = 1.0
            self.progressView.isHidden = true
        }
    }
    // 页面加载失败时调用
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        
        UIView.animate(withDuration: 0.5) {
            self.progressView.progress = 0.0
            self.progressView.isHidden = true
        }
        /// 弹出提示框点击确定返回
        let alertView = UIAlertController.init(title: "提示", message: "加载失败", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title:"确定", style: .default) { okAction in
            _=self.navigationController?.popViewController(animated: true)
        }
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
        
    }
}


//MARK: UI的处理,通知的接收
extension WebViewController {
    
    func baseSetting() {
        self.title = titleStr
    }
    
    
    func initUI() {
        self.view.addSubview(self.webView)
        self.view.addSubview(self.progressView)
        
        view.addSubview(webView)
        webView.frame = view.frame

        
        view.addSubview(progressView)
        progressView.frame = CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: 2)
    }
}


