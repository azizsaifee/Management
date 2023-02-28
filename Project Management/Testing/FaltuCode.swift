//
//  FaltuCode.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 14/02/23.
//

import Foundation

/*
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            //let currentPosition = floatingView.layer.presentation()!.frame.origin
            for x in self.floatingViewCollection {
                for y in self.floatingViewCollection {
                    if x != y && x.frame.intersects(y.frame) {
                        //print("this")
                        self.animate(with: x, signal: true)
                    }
                }
            }
        }
    }
 
 func design() {
     for view in viewCollection {
         view.layer.shadowColor = UIColor.black.cgColor
         view.layer.shadowOpacity = 0.5
         view.layer.shadowOffset = CGSize(width: 5, height: 5)
         view.layer.shadowRadius = 5
         view.subviews.first!.layer.cornerRadius = 35
         view.subviews.first!.clipsToBounds = true
         self.animate(with: view)
     }
 }
 
 func animate(with viewBelowFloatingView: UIView) {
     let animator = UIViewPropertyAnimator(duration: 4.0, curve: .linear) {
         viewBelowFloatingView.subviews.first!.center = self.getRandomPoint(of: viewBelowFloatingView)
     }
     animator.startAnimation()
     animator.addCompletion { position in
         if position == .end {
             self.animate(with: viewBelowFloatingView)
         }
     }
 }
 
 func getRandomPoint(of view: UIView) -> CGPoint {
     let screenWidth = view.bounds.width
     let screenHeight = view.bounds.height
     
     let randomX = CGFloat.random(in: 35...screenWidth - 35)
     let randomY = CGFloat.random(in: 35...screenHeight - 35)
     
     return CGPoint(x: randomX, y: randomY)
 }
 
 //        if dataOption1.text! == answer {
 //            dataOption1.backgroundColor = .systemGreen
 //        } else {
 //            dataOption2.backgroundColor = .systemRed
 //            dataOption3.backgroundColor = .systemRed
 //            dataOption4.backgroundColor = .systemRed
 //        }
 //        if dataOption2.text == answer {
 //            dataOption2.backgroundColor = .systemGreen
 //        } else {
 //            dataOption3.backgroundColor = .systemRed
 //            dataOption3.backgroundColor = .systemRed
 //            dataOption1.backgroundColor = .systemRed
 //        }
 //
 //
 //        if dataOption4.text == answer {
 //            dataOption4.backgroundColor = .systemGreen
 //        } else {
 //            dataOption1.backgroundColor = .systemRed
 //            dataOption2.backgroundColor = .systemRed
 //            dataOption3.backgroundColor = .systemRed
 //        }
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
 
 // Handle link clicks.
 //    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
 //        guard let url = navigationAction.request.url else {
 //            decisionHandler(.cancel)
 //            return
 //        }
 //
 //        // Open links in the default browser
 //        if navigationAction.targetFrame == nil {
 //            UIApplication.shared.open(url, options: [:], completionHandler: nil)
 //            decisionHandler(.cancel)
 //            return
 //        }
 //        decisionHandler(.allow)
 //    }
 
*/


