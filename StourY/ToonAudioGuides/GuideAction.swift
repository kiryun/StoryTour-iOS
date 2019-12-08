//
//  GuideAction.swift
//  StourY
//
//  Created by 김기현 on 04/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension ToonAudioGuideVC{
    @objc func tappedDownButton(btn: UIButton){
        UIView.animate(withDuration: 0.5) {
            print("ToonAudioGuideVC.tappedDownButton")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func changeSegmentValue(sender: CustomSegmentControl){
        switch sender.selectedSegmentIndex {
        case 0://audio
            print("audio seg")
//            self.segmentCtrl.selectedSegmentIndex = 0
            self.createMarkers()
            
            switch User.sharedUser.language{
            case 0:
                self.navTitle.text = "Audio guide"
            case 1:
                self.navTitle.text = "음성 가이드"
            default:
                self.navTitle.text = "Audio guide"
            }
            
        case 1://toon
            print("toon seg")
            self.playBar.removeFromSuperview()
//            self.segmentCtrl.selectedSegmentIndex = 1
            self.createMarkers()
            
            switch User.sharedUser.language{
            case 0:
                self.navTitle.text = "Cartoon guide"
            case 1:
                self.navTitle.text = "카툰 가이드"
            default:
                self.navTitle.text = "Cartoon guide"
            }
        default:
            break
        }
    }
}
