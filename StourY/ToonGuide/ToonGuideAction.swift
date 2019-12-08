//
//  ToonGuideAction.swift
//  StourY
//
//  Created by 김기현 on 08/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension ToonGuideVC{
    @objc func tappedBackButton(btn: UIButton){
        print("ToonGuideVC.tappedBackButton")
//        _ = navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func tappedDownButton(btn: UIButton){
        UIView.animate(withDuration: 0.5) {
            print("ToonAudioGuideVC.tappedDownButton")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func tappedViewPager(gesture:UITapGestureRecognizer){
        print("ToonGuideVC.tappedViewPager")
        UIView.animate(withDuration: 0.3) {
            self.navBar.isHidden = false
        }
    }
}
