//
//  WebViewController.swift
//  iOSLearning
//
//  Created by Danh Nguyen on 12/21/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.delegate = self
        self.webView.loadRequest(URLRequest(url: URL(string: "https://www.google.com.vn/")!))
        self.webView.allowsLinkPreview = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension WebViewController: UIWebViewDelegate {
    
    
    
}






