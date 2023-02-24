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
        let urlString = "https://drive.google.com/file/d/1wzL6WYiw6Pwyt5xE27gw9SIgM1DG7UXD/view?usp=sharing"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        // Create a temporary file URL to download the file
        let temporaryDirectoryURL = FileManager.default.temporaryDirectory
        let fileURL = temporaryDirectoryURL.appendingPathComponent(url.lastPathComponent)
        
        // Download the file asynchronously
        let session = URLSession.shared
        let task = session.downloadTask(with: url) { (location, response, error) in
            if let error = error {
                print("Error downloading file: \(error)")
                return
            }
            guard let location = location else {
                print("Invalid file location")
                return
            }
            do {
                try FileManager.default.moveItem(at: location, to: fileURL)
                DispatchQueue.main.async {
                    controller.reloadData()
                }
            } catch {
                print("Error moving file: \(error)")
            }
        }
        task.resume()
        
        return fileURL as QLPreviewItem
    }

    // MARK: - IBActions
    @IBAction func showPdfBtn(_ sender: Any) {
//        let previewController = QLPreviewController()
//        previewController.dataSource = self
//        present(previewController, animated: true, completion: nil)
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
