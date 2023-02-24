//
//  webViewVC.swift
//  Project Management
//
//  Created by Apple on 24/02/23.
//

import UIKit
import WebKit

class webViewVC: UIViewController {

    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://drive.google.com/file/d/1wzL6WYiw6Pwyt5xE27gw9SIgM1DG7UXD/view?usp=sharing")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
