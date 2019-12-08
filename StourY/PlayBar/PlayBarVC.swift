//
//  PlayBarVC.swift
//  StourY
//
//  Created by 김기현 on 01/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import AVFoundation

class PlayBarVC: UIViewController {
    var screenFrameWidth = UIScreen.main.bounds.width

    //ui
    var titleLabel = UILabel()
    var seekBar = UISlider()
    var currentTimeLabel = UILabel()
    var timeLengthLabel = UILabel()
    var playButton = UIButton(type: .custom)
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //받아온 데이터
    var arrayImageList = Array<GuideImageListForm>()
    
    //audio
    
    let timePlayerSelector:Selector = #selector(updatePlayTime)
    var progressTimer : Timer!          //타이머를 위한 변수
    var audioPlayer: AudioPlayer!
    
    enum AVState{
        case play
        case pause
        case stop
    }
    var nowAVState: AVState = AVState.stop
    
    var fullView: CGFloat{
        return UIScreen.main.bounds.height * 0.5
    } //= 100
    var partialView: CGFloat {
        return UIScreen.main.bounds.height - self.screenFrameWidth * 0.31
    }
    
    //data
    //didSet을 하게 되면 이뷰가 로드되기 전에 audioGuide라는 변수가 set되면 아래의 함수들이 호출 됨
    var audioGuide: AudioGuideForm?{
        didSet{
            self.audioPlayer = AudioPlayer.sharedAudio
            viewSetRadius(view: self.view, radius: 10.0, color: false)
            
            self.setupView()

            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.fullView =

        
        //gesture 등록
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(self.panGesture(_:)))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }
    
    
}
