//
//  webViewVC.swift
//  Project Management
//
//  Created by Apple on 24/02/23.
//

import UIKit
import WebKit

class webViewVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://drive.google.com/file/d/1z04GMpx0UTxwqhjmiN9lKonV1mb9tNiJ/view?usp=sharing")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    // MARK: IBActions
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
