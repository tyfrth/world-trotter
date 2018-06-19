//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Tyler Frith on 6/19/18.
//  Copyright © 2018 tfrth. All rights reserved.
//

import Foundation
import WebKit

class WebViewController: UIViewController {
    
 
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        let url = URL(string: "https://www.google.com/maps")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    
}
