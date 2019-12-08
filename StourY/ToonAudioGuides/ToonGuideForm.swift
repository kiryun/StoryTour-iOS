//
//  ToonGuideForm.swift
//  StourY
//
//  Created by 김기현 on 04/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

struct ToonGuideForm{
    var idx: Int?
    var guideIdx: Int?
    var title: String?
    var description: String?
    var lat: Double?
    var lon: Double?
    var east: Double?
    var west: Double?
    var north: Double?
    var south: Double?
    var thumnailAddress: String?
    var language: Int?
    var cartoonImageAddressList: Array<String>?
}

func setResponseData(responseObject: NSArray?, list:inout Array<ToonGuideForm>){
    //var tempList: Array<AroundForm> = Array()
    for tempData in responseObject!{
        let tempDict: NSDictionary = tempData as! NSDictionary
        list.append(
            ToonGuideForm.init(
                idx: tempDict.object(forKey: "idx") as? Int,
                guideIdx: tempDict.object(forKey: "guideIdx") as? Int,
                title: tempDict.object(forKey: "title") as? String,
                description: tempDict.object(forKey: "description") as? String,
                lat: tempDict.object(forKey: "lat") as? Double,
                lon: tempDict.object(forKey: "lon") as? Double,
                east: tempDict.object(forKey: "east") as? Double,
                west: tempDict.object(forKey: "west") as? Double,
                north: tempDict.object(forKey: "north") as? Double,
                south: tempDict.object(forKey: "south") as? Double,
                thumnailAddress: tempDict.object(forKey: "thumnailAddress") as? String,
                language: tempDict.object(forKey: "language") as? Int,
                cartoonImageAddressList: tempDict.object(forKey: "cartoonImageAddressList") as? Array<String>
            )
        )
    }
}
