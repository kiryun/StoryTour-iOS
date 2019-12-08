//
//  PlayBarAction.swift
//  StourY
//
//  Created by 김기현 on 01/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension PlayBarVC{
    
    @objc func onTouchPlayButton(sender: UIButton){
        
        if self.nowAVState == .stop{ //stop
            //                self.avPlayer.play()//
//            self.audioPlayer.stop()
            self.setupAudio()
            self.timeLengthLabel.text = self.audioPlayer.getAudioLength()
            self.audioPlayer.play()
            self.nowAVState = .play
            self.playButton.setImage(UIImage(named: "btn_stop"), for: .normal)
            //프로그레스 타이머 설정
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: self.timePlayerSelector, userInfo: nil, repeats: true)
        }
        else if self.nowAVState == .pause{ // pause
            self.audioPlayer.play()
            self.nowAVState = .play
            self.playButton.setImage(UIImage(named: "btn_stop"), for: .normal)
            //프로그레스 타이머 설정
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: self.timePlayerSelector, userInfo: nil, repeats: true)
        }
        else if self.nowAVState != .pause{ //play stop
            self.playButton.setImage(UIImage(named: "btn_start"), for: .normal)
            //self.avPlayer.pause()//
            self.audioPlayer.pause()
            self.nowAVState = .pause
        }
    }
   
}
