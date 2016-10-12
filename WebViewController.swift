//
//  WebViewController.swift
//  WoldTrotter
//
//  Created by BAZZAOUI chaymae on 10/11/16.
//  Copyright © 2016 Klechkowski. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.bignerdranch.com")
        let myRequest = URLRequest(url: myURL!)
        
        webView.load(myRequest)
        
    }
    
}
