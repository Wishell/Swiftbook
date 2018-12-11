//
//  WebViewController.swift
//  Eaters
//
//  Created by Wishell on 12.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var url: URL!
    var webView: WKWebView!
    var progressView: UIProgressView!
    
    deinit {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let request = URLRequest(url: url)
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        
        let progreeButton = UIBarButtonItem(customView: progressView)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [progreeButton,spacer,refresh]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension WebViewController: WKNavigationDelegate { }
