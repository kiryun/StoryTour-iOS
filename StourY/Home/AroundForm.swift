//
//  AroundMainForm.swift
//  StoryTour
//
//  Created by 김기현 on 03/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

struct AroundForm{
    var idx: Int?
    var lat: Double?
    var lon: Double?
    var thumnailAddr: String?
    var thumnailAddr2: String?
    var name: String?
    var type: Int?
    var liked: Bool?
    var tagSet: Array<String>?
}

func setResponseData(responseObject: NSArray?, list:inout Array<AroundForm>){
    //var tempList: Array<AroundForm> = Array()
    for tempData in responseObject!{
        let tempDict: NSDictionary = tempData as! NSDictionary
        list.append(
            AroundForm.init(
                idx: tempDict.object(forKey: "idx") as? Int,
                lat: tempDict.object(forKey: "lat") as? Double,
                lon: tempDict.object(forKey: "lon") as? Double,
                thumnailAddr: tempDict.object(forKey: "thumnailAddr") as? String,
                thumnailAddr2: tempDict.object(forKey: "thumnailAddr2") as? String,
                name: tempDict.object(forKey: "name") as? String,
                type: tempDict.object(forKey: "type") as? Int,
                liked: tempDict.object(forKey: "liked") as? Bool,
                tagSet: tempDict.object(forKey: "tagSet") as? Array<String>
            )
        )
    }
    //list.append(tempList)
}

func setResponseData(responseObject: NSArray?, list:inout Array<AroundForm>, imgList:inout Array<UIImage>){
    //var tempList: Array<AroundForm> = Array()
    for tempData in responseObject!{
        let tempDict: NSDictionary = tempData as! NSDictionary
        list.append(
            AroundForm.init(
                idx: tempDict.object(forKey: "idx") as? Int,
                lat: tempDict.object(forKey: "lat") as? Double,
                lon: tempDict.object(forKey: "lon") as? Double,
                thumnailAddr: tempDict.object(forKey: "thumnailAddr") as? String,
                thumnailAddr2: tempDict.object(forKey: "thumnailAddr2") as? String,
                name: tempDict.object(forKey: "name") as? String,
                type: tempDict.object(forKey: "type") as? Int,
                liked: tempDict.object(forKey: "liked") as? Bool,
                tagSet: tempDict.object(forKey: "tagSet") as? Array<String>
            )
        )
        imgList.append(getImageFromURL(strURL: tempDict.object(forKey: "thumnailAddr") as! String))
    }
    //list.append(tempList)
}

func setSearchResultData(responseObject: NSArray?, list:inout Array<AroundForm>, imgList:inout Array<UIImage>){
    //var tempList: Array<AroundForm> = Array()
    list.removeAll()
    for tempData in responseObject!{
        let tempDict: NSDictionary = tempData as! NSDictionary
        list.append(
            AroundForm.init(
                idx: tempDict.object(forKey: "idx") as? Int,
                lat: tempDict.object(forKey: "lat") as? Double,
                lon: tempDict.object(forKey: "lon") as? Double,
                thumnailAddr: tempDict.object(forKey: "thumnailAddr") as? String,
                thumnailAddr2: tempDict.object(forKey: "thumnailAddr2") as? String,
                name: tempDict.object(forKey: "name") as? String,
                type: tempDict.object(forKey: "type") as? Int,
                liked: tempDict.object(forKey: "liked") as? Bool,
                tagSet: tempDict.object(forKey: "tagSet") as? Array<String>
            )
        )
        imgList.append(getImageFromURL(strURL: tempDict.object(forKey: "thumnailAddr") as! String))
    }
    //list.append(tempList)
}
