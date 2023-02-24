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

class ContentVC: UIViewController,QLPreviewControllerDataSource {
    
    // MARK: - Variables
    static var stringForTitle: String?
    var pdfViewObject: PDFView = PDFView()
    var pdfDocumentationObject: PDFDocument = PDFDocument()
    var totalPages = 0
 
    // MARK: IBOutlets
    @IBOutlet weak var ShowPdfBtn: UIButton!
    @IBOutlet weak var textViewForContent: UITextView!
    @IBOutlet weak var labelForTittle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        labelForTittle.text = ContentVC.stringForTitle
        addContent()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContentVCCellClass.nib(), forCellWithReuseIdentifier: "ContentVCCellClass")
    }
    
    // MARK: - Required Methods
    func addContent() {
        if let dictionary = ViewAfterDetailsVC.myOptionalDictionary {
            for (_, value) in dictionary {
                for key in value.keys {
                    if ContentVC.stringForTitle == key {
                        textViewForContent.text = value[key]
                    }
                }
            }
        }
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let url = Bundle.main.url(forResource: "ayush", withExtension: "pdf")!
        return url as QLPreviewItem
    }

    // MARK: - IBActions
    @IBAction func showPdfBtn(_ sender: Any) {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true, completion: nil)
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
