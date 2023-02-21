//
//  ContentVCCellClass.swift
//  Project Management
//
//  Created by Apple on 16/02/23.
//

import UIKit
import AVKit

class ContentVCCellClass: UICollectionViewCell {

    var player: AVPlayer?
    
    @IBOutlet weak var viewForCollectionView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ContentVCCellClass", bundle: nil)
    }
    
    func configure(with index: Int) {
        print("Hurray!!")
        addPlayerToView(viewForCollectionView)
    }
    
    func addPlayerToView(_ view: UIView) {
        let videoURL = URL(filePath: "/Users/apple/Desktop/Onboarding.mp4")
        let playerItem = AVPlayerItem(url: videoURL)
        player = AVPlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspect
        view.layer.addSublayer(playerLayer)
        player?.appliesMediaSelectionCriteriaAutomatically = true
        player?.play()
    }
}
