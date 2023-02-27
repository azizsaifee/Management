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

class ContentVC: UIViewController {
    
    // MARK: - Variables
    static var stringForTitle: String?
    var pdfViewObject: PDFView = PDFView()
    var pdfDocumentationObject: PDFDocument = PDFDocument()
    var totalPages = 0
    
    // MARK: IBOutlets
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var ShowPdfBtn: UIButton!
    //@IBOutlet weak var webViewForContent: WKWebView!
    @IBOutlet weak var labelForTittle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewForText: UITextView!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        labelForTittle.text = ContentVC.stringForTitle
        addContent()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContentVCCellClass.nib(), forCellWithReuseIdentifier: "ContentVCCellClass")
        headingLabel.text = ContentVC.stringForTitle
    }
    // ViewAfterDetailsVC.myOptionalDictionary
    func addContent() {
        if let dictionary = ViewAfterDetailsVC.myOptionalDictionary {
            for (key, value) in dictionary {
                if let subDictionary = value as? [String: Any] {
                    for key in subDictionary.keys {
                        if ContentVC.stringForTitle == key {
                            viewForText.text = subDictionary[key] as? String
                        }
                    }
                } else {
                    if ContentVC.stringForTitle == "\(key)" {
                        viewForText.text = "\(value)"
                    }
                }
            }
        }
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
