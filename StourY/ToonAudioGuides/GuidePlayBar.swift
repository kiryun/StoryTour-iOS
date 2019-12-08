//
//  PlayBarSetup.swift
//  StourY
//
//  Created by 김기현 on 30/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension ToonAudioGuideVC: UICollisionBehaviorDelegate{
    func addPlayBarVC(){
//        let playBarVC = playBarVC()// 이렇게하면 storyboard가 로드가 안되서 collectionView가 nil이 되버림
        let playBarVC = storyboard?.instantiateViewController(withIdentifier: "PlayBarVC") as! PlayBarVC
        
        let width = view.frame.width
        let height = view.frame.height
        playBarVC.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.screenFrameWidth * 0.31, width: width, height: height)
        
        //보낼 데이터
        let audioGuide = self.audioGuideList[self.currentMarker]
        playBarVC.arrayImageList = self.audioGuideList[self.currentMarker].guideImageList!
//        playBarVC.fullView =  self.screenFrameWidth * 0.31
        playBarVC.audioGuide = audioGuide// playBarVC에서 audioGuide에 didSet이 있기 때문에 항상 audioGuide를 가장 늦게 set해준다.
        
        
        self.addChildViewController(playBarVC)
        self.view.addSubview(playBarVC.view)
        playBarVC.didMove(toParentViewController: self)
        
        self.playBar = playBarVC.view
        
    }
}

