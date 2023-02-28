//
//  ContentVCCellClass.swift
//  Project Management
//
//  Created by Apple on 16/02/23.
//

import UIKit
import WebKit

class ContentVCCellClass: UICollectionViewCell, WKNavigationDelegate {

    // MARK: - Variables
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: IBOutlets
    @IBOutlet weak var viewForCollectionView: UIView!
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: View Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let url = URL(string: "https://drive.google.com/file/d/1oeDWNOxspP8Cd2W_5X1uR0A093ORrkzH/view?usp=sharing")!
        let request = URLRequest(url: url)
        webView.load(request)
        webView.backgroundColor = .clear
        activityIndicator.center = webView.center
        webView.addSubview(activityIndicator)
        webView.navigationDelegate = self
        activityIndicator.startAnimating()
    }
    
    // MARK: - Required Methods
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ContentVCCellClass", bundle: nil)
    }
    
    func configure(with index: Int) {
        //addPlayerToView(viewForCollectionView)
    }
}
