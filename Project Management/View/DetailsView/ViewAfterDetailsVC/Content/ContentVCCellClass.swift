//
//  ContentVCCellClass.swift
//  Project Management
//
//  Created by Apple on 16/02/23.
//

import UIKit
import AVKit
import WebKit

class ContentVCCellClass: UICollectionViewCell {

    var player: AVPlayer?
    
    @IBOutlet weak var viewForCollectionView: UIView!
    @IBOutlet weak var webView: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let url = URL(string: "https://drive.google.com/file/d/1oeDWNOxspP8Cd2W_5X1uR0A093ORrkzH/view?usp=sharing")!
        let request = URLRequest(url: url)
        webView.load(request)
        webView.backgroundColor = .clear
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ContentVCCellClass", bundle: nil)
    }
    
    func configure(with index: Int) {
        //addPlayerToView(viewForCollectionView)
    }
    
//    func addPlayerToView(_ view: UIView) {
//        let videoURL = URL(filePath: "/Users/apple/Desktop/Onboarding.mp4")
//        let playerItem = AVPlayerItem(url: videoURL)
//        player = AVPlayer(playerItem: playerItem)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = CGRect(x: 40, y: 40, width: viewForCollectionView.bounds.width, height: viewForCollectionView.bounds.height)
//        viewForCollectionView.center = playerLayer.bounds.origin
//        playerLayer.bounds.origin = viewForCollectionView.center
//        playerLayer.videoGravity = .resizeAspect
//        viewForCollectionView.layer.addSublayer(playerLayer)
//        player?.appliesMediaSelectionCriteriaAutomatically = true
//        player?.play()
//    }
}
