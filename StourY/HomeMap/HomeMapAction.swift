//
//  HomeMapAction.swift
//  StourY
//
//  Created by 김기현 on 05/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation


extension HomeMapVC{
//    @objc func tappedBackButton(btn: UIButton){
//        print("HomeMapVC.tappedBackButton")
//        self.navigationController?.popViewController(animated: true)
//    }
    
    @objc func tappedCompletedSetupButton(btn: UIButton){
        print("tappedCompletedSetupButton")
        if self.marker.position.latitude != -180.0 || self.marker.position.longitude != -180.0{
            
            self.navigationController?.popViewController(animated: true)
        }else{
            //toast
            switch User.sharedUser.language{
            case 0:
                ToastView.shared.short(self.view, txt_msg: "Please set your location")
            case 1:
                ToastView.shared.short(self.view, txt_msg: "위치를 설정해주세요")
            default:
                ToastView.shared.short(self.view, txt_msg: "Please set your location")
            }
        }
    }
}
