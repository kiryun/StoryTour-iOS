//
//  TourDetailForm.swift
//  StourY
//
//  Created by 김기현 on 17/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
struct TourDetailForm{
    var idx: Int?
    var name: String?
    var subway: String?
    var tel: String?
    var score: Double?
    var lat: Double?
    var lon:Double?
    var tip: String?
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
    var experience: String?
    var experienceAge: String?
    var useTime: String?
    var myEvaluation: Int?
    var visited: Bool?
    var liked: Bool?
}

func setResponseData(responseObject: NSDictionary?, tour:inout Dictionary<String,Any>){
    //var tempList: Array<AroundForm> = Array()
    let tempData = responseObject as! NSDictionary
//    TourDetailForm.init(idx: <#T##Int?#>,
//                        name: <#T##String?#>,
//                        subway: <#T##String?#>,
//                        tel: <#T##String?#>,
//                        score: <#T##Double?#>,
//                        lat: <#T##Double?#>,
//                        lon: <#T##Double?#>,
//                        tip: <#T##String?#>,
//                        parkable: <#T##String?#>,
//                        thumnailAddr: <#T##String?#>,
//                        hasGuide: <#T##Bool?#>,
//                        cat1: <#T##String?#>,
//                        cat2: <#T##String?#>,
//                        cat3: <#T##String?#>,
//                        addr: <#T##String?#>,
//                        summary: <#T##String?#>,
//                        detail: <#T##String?#>,
//                        holiday: <#T##String?#>,
//                        tagSet: <#T##Array<String>?#>,
//                        imgList: <#T##Array<String>?#>,
//                        experience: <#T##String?#>,
//                        experienceAge: <#T##String?#>,
//                        useTime: <#T##String?#>,
//                        myEvaluation: <#T##Int?#>,
//                        visited: <#T##Bool?#>,
//                        liked: <#T##Bool?#>
//    )
    tour["idx"] = tempData.object(forKey: "idx") as? Int
    tour["name"] = tempData.object(forKey: "name") as? String
    tour["subway"] = tempData.object(forKey: "subway") as? String
    tour["tel"] = tempData.object(forKey: "tel") as? String
    tour["score"] = tempData.object(forKey: "score") as? Double
    tour["lat"] = tempData.object(forKey: "lat") as? Double
    tour["lon"] = tempData.object(forKey: "lon") as? Double
    tour["tip"] = tempData.object(forKey: "tip") as? String
    tour["parkable"] = tempData.object(forKey: "parkable") as? String
    tour["thumnailAddr"] = tempData.object(forKey: "thumnailAddr") as? String
    tour["hasGuide"] = tempData.object(forKey: "hasGuide") as? Bool
    tour["cat1"] = tempData.object(forKey: "cat1") as? String
    tour["cat2"] = tempData.object(forKey: "cat2") as? String
    tour["cat3"] = tempData.object(forKey: "cat3") as? String
    tour["addr"] = tempData.object(forKey: "addr") as? String
    tour["summary"] = tempData.object(forKey: "summary") as? String
    tour["detail"] = tempData.object(forKey: "detail") as? String
    tour["holiday"] = tempData.object(forKey: "holiday") as? String
    tour["tagSet"] = tempData.object(forKey: "tagSet") as? Array<String>
    tour["imgList"] = tempData.object(forKey: "imgList") as? Array<String>
    tour["experience"] = tempData.object(forKey: "experience") as? String
    tour["experienceAge"] = tempData.object(forKey: "experienceAge") as? String
    tour["useTime"] = tempData.object(forKey: "useTime") as? String
    tour["myEvaluation"] = tempData.object(forKey: "myEvaluation") as? Int
    tour["visited"] = tempData.object(forKey: "visited") as? Bool
    tour["liked"] = tempData.object(forKey: "liked") as? Bool
}
