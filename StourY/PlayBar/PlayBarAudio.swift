//
//  PlayBarAudio.swift
//  StourY
//
//  Created by 김기현 on 01/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
import AVFoundation

extension PlayBarVC{
    func setupAudio(){
//        print((self.audioGuide?.voiceAddress)!)
        if Reachability.isConnectedToNetwork(){
            self.audioPlayer.initAudio(sendUrl: (self.audioGuide?.voiceAddress)!)
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
        //데이터를 다 받고 patch하기 전까지는 재생버튼을 정지버튼으로 냅둔다. 또는 로딩 바
    }
    
    //앞에서 만든 타이머에 의해 0.1초 간격으로 이 함수가 실행되는데 그때마다 재생시간을 라벨과 seekbar에 보여준다.
    @objc func updatePlayTime() -> Void{
        self.currentTimeLabel.text = audioPlayer.getCurrentTime()
        let current = self.audioPlayer.getCurrentTimeDouble()
        let length = self.audioPlayer.getAudioLengthDouble()
        self.seekBar.setValue(Float(current/length), animated: true)
    }
}
