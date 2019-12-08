//
//  AudioPlayer.swift
//  StourY
//
//  Created by 김기현 on 01/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer{
    //오디오 관련
    //음악파일 default path
    //http://13.125.83.183:8080//resources/guides/voice/    ch_e_00_intro.m4a
    
    private let audioDefaultPath = "http://13.125.83.183:8080//resources/guides/voice/"

    var audioPlayer : AVAudioPlayer!    //avaudioplayer인스턴스 변수
    var audioFile : URL!                // 재생할 오디오의 파일명 변수
    let MAX_VOLUME : Float = 10.0       //최대 불륨, 실수형 상수
    var audioSession = AVAudioSession.sharedInstance() // 백그라운드에서도 동작가능하게 해주는 변수



    //audio나 이미지같이 크기가 큰파일은 url만 일단 가져오고 아래와 같이 실제 쓸 때만 불러서 쓰는 걸로
    public func initAudio(sendUrl: String){
        print("initAudio")
        let url = sendUrl
        
        //오디오 파일 받아옴
        if let nsURL = NSURL(string: self.audioDefaultPath+url){
            let data = NSData(contentsOf: nsURL as URL)
            do{
                self.audioPlayer = try AVAudioPlayer(data: data! as Data)
            }
            catch let error as NSError{
                print("audio error make by hyun: ", error)
            }
        }
        print("audio Player in init: ", self.audioPlayer)
        if self.audioPlayer == Optional.none{
            print("audioPlayer is none")
        }
        
        //백그라운드에서도 가능하게 해줌
        do{
            try self.audioSession.setCategory(AVAudioSessionCategoryPlayback)
        }catch{
            
        }
        
    }

    //00:00형태로 바꾸기 위해 timeinterval 값을 받아 문자열로 돌려보내는 함수
    private func convertNSTimeInterval2String(_ time:TimeInterval) -> String {
        //재생시간의 매개변수인 time값을 60으로 나눈 몫을 정수 값으로 변환하여 상수 min에 초기화
        let min = Int(time/60)
        //time값을 60으로 나눈 나머지 값을 정수 값으로 변환하여 상수 sec 값에 초기화 한다.
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        //이 두 값을 이용해서 "%02d:%02d" 형태의 문자열로 변환하여 상수에 초기화
        let strTime = String(format: "%02d:%02d",min,sec)

        return strTime

    }

    public func getCurrentTimeDouble() -> Double {
        return self.audioPlayer.currentTime
    }
    public func getAudioLengthDouble() -> Double {
        return self.audioPlayer.duration
    }

    public func getCurrentTime() -> String {
        //오디오 길이 추출
        if self.audioPlayer == Optional.none{
            print("is none")
        }
        let audioCurrent = self.audioPlayer.currentTime
        //let audioSecond = CMTimeGetSeconds(audioCurrent)
        let strTime = self.convertNSTimeInterval2String(audioCurrent)
        return strTime
    }

    public func getAudioLength() -> String {
        if self.audioPlayer != nil{
            let strEndTime = self.convertNSTimeInterval2String(self.audioPlayer.duration)
            return strEndTime
        }
        else{
            return ""
        }
    }

    public func play(){
        if self.audioPlayer != nil{
            self.audioPlayer.play()
        }
    }

    public func stop(){
        if self.audioPlayer != nil{
            self.audioPlayer.stop()
        }
    }

    public func pause(){
        if self.audioPlayer != nil{
            self.audioPlayer.pause()
        }
    }
    
    public static let sharedAudio: AudioPlayer = {
        let instance = AudioPlayer()
        
        return instance
    }()
}
