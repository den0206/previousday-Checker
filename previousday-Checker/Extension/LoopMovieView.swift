//
//  LoopMovieView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/20.
//

import SwiftUI
import AVFoundation


struct LoopMoviewView : UIViewRepresentable {
    
    var fileName : String?

    func makeUIView(context: Context) -> some UIView {
        return LoopPlayerView(fileName: fileName)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

class LoopPlayerView : UIView {
    
  
    private var playerLayer = AVPlayerLayer()
    private var playerLooper : AVPlayerLooper?
    
    
    init(fileName : String?) {
        
        super.init(frame: .zero)

        var fileUrl : URL?
        
        if fileName == nil {
            
            let iValue = Int.random(in: 1 ... 7)
            
            fileUrl = Bundle.main.url(forResource: "couple-\(iValue)", withExtension: "mp4")
        } else {
            fileUrl = Bundle.main.url(forResource: "\(fileName!)", withExtension: "mp4")
            
        }
        
        guard fileUrl != nil else {print("No URL"); return}
        
        let item = AVPlayerItem(url: fileUrl!)
    
        
        let player = AVQueuePlayer(playerItem: item)
        player.isMuted = true
        playerLayer.player = player
        playerLayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspectFill.rawValue)
        layer.addSublayer(playerLayer)
        
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        
        player.play()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
