//
//  AudioGuideForm.swift
//  StourY
//
//  Created by 김기현 on 28/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

struct GuideImageListForm {
    var idx: Int?
    var guideIdx: Int?
    var description: String?
    var imgAddress: String?
}

struct AudioGuideForm{
    var idx: Int?
    var guideIdx: Int?
    var title: String?
    var description: String?
    var length: Int?
    var lat: Double?
    var lon: Double?
    
    var voiceAddress: String?
    var guideImageList: Array<GuideImageListForm>?
}

func setResponseData(responseObject: NSArray?, list:inout Array<AudioGuideForm>){
    //var tempList: Array<AroundForm> = Array()
    var tempArrayImage = Array<GuideImageListForm>()
    for i in 0 ..< responseObject!.count{
        let tempDict: NSDictionary = responseObject![i] as! NSDictionary
        
        tempArrayImage.removeAll()
        //guide Image Listv
        for tempImage in tempDict.object(forKey: "guideImageList") as! NSArray{
            let tempImageDict: NSDictionary = tempImage as! NSDictionary
            tempArrayImage.append(
                GuideImageListForm.init(
                    idx: tempImageDict.object(forKey: "idx") as? Int,
                    guideIdx: tempImageDict.object(forKey: "guideIdx") as? Int,
                    description: tempImageDict.object(forKey: "description") as? String,
                    imgAddress: tempImageDict.object(forKey: "imgAddress") as? String
                )
            )
        }
        
        //guide list
        list.append(
            AudioGuideForm.init(
                idx: tempDict.object(forKey: "idx") as? Int,
                guideIdx: tempDict.object(forKey: "guideIdx") as? Int,
                title: tempDict.object(forKey: "title") as? String,
                description: tempDict.object(forKey: "description") as? String,
                length: tempDict.object(forKey: "length") as? Int,
                lat: tempDict.object(forKey: "lat") as? Double,
                lon: tempDict.object(forKey: "lon") as? Double,
                voiceAddress: tempDict.object(forKey: "voiceAddress") as? String,
                guideImageList: tempArrayImage
            )
        )
    }
}

