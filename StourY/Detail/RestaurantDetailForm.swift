//
//  RestaurantDetailForm.swift
//  StourY
//
//  Created by 김기현 on 17/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

struct RestaurantDetailForm {

    var idx: Int?
    var name: String?
    var subway: String?
    var tel: String?
    var score: Double?
    var lat: Double?
    var lon: Double?
    var tip:String?
    var parkable: String?
    var thumnailAddr: String?
    var hasGuide: Bool?
    var cat1: String?
    var cat2: String?
    var cat3: String?
    var addr: String?
    var summary: String?
    var detail: String?
    var holiday: String?
    var tagSet: Array<String>?
    var imgList: Array<String>?
    var operationTime: String?
    var mainMenu: String?
    var menu: String?
    var discount: String?
    var myEvaluation: Int?
    var visited: Bool?
    var liked: Bool?

}

func setResponseData(responseObject: NSDictionary?, restaurant:inout Dictionary<String,Any>){
    //var tempList: Array<AroundForm> = Array()
    let tempData = responseObject as! NSDictionary
    
    restaurant["idx"] = tempData.object(forKey: "idx") as? Int
    restaurant["name"] = tempData.object(forKey: "name") as? String
    restaurant["subway"] = tempData.object(forKey: "subway") as? String
    restaurant["tel"] = tempData.object(forKey: "tel") as? String
    restaurant["score"] = tempData.object(forKey: "score") as? Double
    restaurant["lat"] = tempData.object(forKey: "lat") as? Double
    restaurant["lon"] = tempData.object(forKey: "lon") as? Double
    restaurant["tip"] = tempData.object(forKey: "tip") as? String
    restaurant["parkable"] = tempData.object(forKey: "parkable") as? String
    restaurant["thumnailAddr"] = tempData.object(forKey: "thumnailAddr") as? String
    restaurant["hasGuide"] = tempData.object(forKey: "hasGuide") as? Bool
    restaurant["cat1"] = tempData.object(forKey: "cat1") as? String
    restaurant["cat2"] = tempData.object(forKey: "cat2") as? String
    restaurant["cat3"] = tempData.object(forKey: "cat3") as? String
    restaurant["addr"] = tempData.object(forKey: "addr") as? String
    restaurant["summary"] = tempData.object(forKey: "summary") as? String
    restaurant["detail"] = tempData.object(forKey: "detail") as? String
    restaurant["holiday"] = tempData.object(forKey: "holiday") as? String
    restaurant["tagSet"] = tempData.object(forKey: "tagSet") as? Array<String>
    restaurant["imgList"] = tempData.object(forKey: "imgList") as? Array<String>
    restaurant["operationTime"] = tempData.object(forKey: "operationTime") as? String
    restaurant["mainMenu"] = tempData.object(forKey: "mainMenu") as? String
    restaurant["menu"] = tempData.object(forKey: "menu") as? String
    restaurant["discount"] = tempData.object(forKey: "discount") as? String
    restaurant["myEvaluation"] = tempData.object(forKey: "myEvaluation") as? Int
    restaurant["visited"] = tempData.object(forKey: "visited") as? Bool
    restaurant["liked"] = tempData.object(forKey: "liked") as? Bool
}
