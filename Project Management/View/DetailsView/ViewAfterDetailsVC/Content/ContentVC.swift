//
//  OnboardingVC.swift
//  Project Management
//
//  Created by Apple on 08/02/23.
//

import UIKit
import AVKit
import PDFKit
import QuickLook
import WebKit

class ContentVC: UIViewController, WKNavigationDelegate {
    
    // MARK: - Variables
    static var stringForTitle: String?
    var pdfViewObject: PDFView = PDFView()
    var pdfDocumentationObject: PDFDocument = PDFDocument()
    var totalPages = 0
    let htmlString: String? =
    """
    <html>  <body> <div style="font-family: Arial; font-size: 25px; line-height: 1.5; text-align: justify;">
    <p>Microservices are an architectural style for building complex applications by breaking them down into smaller, independent services that can communicate with each other over a network. Each microservice is focused on a specific business capability and can be developed, deployed, and scaled independently of the others.</p>
    <p>One of the key benefits of microservices is their flexibility and agility. Because each service is independent, developers can work on different parts of the application at the same time, without worrying about dependencies or conflicts. This allows for faster development and deployment cycles, which can be crucial in today's fast-paced business environment.</p>
    <p>Another advantage of microservices is their scalability. Because each service can be scaled independently, it's possible to allocate more resources to the parts of the application that need it most. This can help ensure that the application can handle spikes in traffic or usage without slowing down or crashing.</p>
    <p>However, there are also some challenges associated with microservices. For example, managing the complexity of multiple services can be difficult, and coordinating the communication between them can be a challenge. Additionally, ensuring that each service is secure and reliable can be more complex than in a monolithic architecture.</p>
    <p>Despite these challenges, microservices are becoming increasingly popular, with many large companies adopting them to improve their software development processes. If you're interested in learning more about microservices, check out <a href="https://microservices.io/" target="_blank">microservices.io</a>, a comprehensive resource for information and best practices related to microservices. You can also visit <a href="https://www.nginx.com/microservices/" target="_blank">nginx.com</a> to learn about how NGINX can help you build and manage microservices at scale.</p>
    </div></body></html>
    """
    
    // MARK: IBOutlets
    @IBOutlet weak var ShowPdfBtn: UIButton!
    @IBOutlet weak var webViewForContent: WKWebView!
    @IBOutlet weak var labelForTittle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        labelForTittle.text = ContentVC.stringForTitle
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContentVCCellClass.nib(), forCellWithReuseIdentifier: "ContentVCCellClass")
        
        webViewForContent.backgroundColor = .clear
        webViewForContent.navigationDelegate = self
        webViewForContent.loadHTMLString(htmlString ?? "Data Coming Soon!", baseURL: nil)

    }
    
    // Handle link clicks.
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        
        // Open links in the default browser
        if navigationAction.targetFrame == nil {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
    
    // MARK: - Required Methods
    //    func addContent() {
    //        if let dictionary = ViewAfterDetailsVC.myOptionalDictionary {
    //            for (_, value) in dictionary {
    //                for key in value.keys {
    //                    if ContentVC.stringForTitle == key {
    //                        textViewForContent.text = value[key]
    //                    }
    //                }
    //            }
    //        }
    //    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }

    // MARK: - IBActions
    @IBAction func showPdfBtn(_ sender: Any) {
        let webviewvc = (self.storyboard?.instantiateViewController(withIdentifier: "webViewVC") as? webViewVC)!
        self.navigationController?.pushViewController(webviewvc, animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ContentVC: UICollectionViewDelegate {
}

extension ContentVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentVCCellClass", for: indexPath) as! ContentVCCellClass
        cell.configure(with: indexPath.row)
        return cell
    }
}

extension ContentVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
