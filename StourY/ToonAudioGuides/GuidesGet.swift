//
//  GuidesGet.swift
//  StourY
//
//  Created by 김기현 on 28/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension ToonAudioGuideVC{
    func getGuides(){
        if Reachability.isConnectedToNetwork(){
            ApiClient.sharedApiClient.getAudioGuide(attractionIdx: self.attrIdx) { (res, err) in
                if err == nil{
                    print("successs get audio guide")
                    setResponseData(responseObject: res, list: &self.audioGuideList)
                    //                print(self.audioGuideList)
                    self.createMarkers()
                    //                self.setupView()
                }else{
                    print("audioGuide list fail!")
                }
            }
            
            ApiClient.sharedApiClient.getCartoonGuide(attractionIdx: self.attrIdx) { (res, err) in
                if err == nil{
                    print("success get toon guide")
                    setResponseData(responseObject: res, list: &self.toonGuideList)
                    
                    self.createMarkers()
                    //                self.setupView()
                }
            }
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
        
    }
    
}
