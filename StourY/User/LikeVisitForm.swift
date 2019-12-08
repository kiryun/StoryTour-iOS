//
//  LikeVisitForm.swift
//  StoryTour
//
//  Created by 김기현 on 12/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

struct LikeVisitForm{
    var idx: Int?
    var name: String?
    var cat1: String?
    var cat2: String?
    var cat3: String?
    var myEvaluation: Int?
    var tel: String?
    var likeCnt: Int?
    var visitCnt: Int?
    var reviewCnt: Int?
    var lat: Double?
    var lon: Double?
    var addr: String?
    var summary: String?
    var detail: String?
    var homepage: String?
    var thumnailAddr: String?
    var type: Int?
    var tagSet: Array<String>?
    var liked: Bool?
    //like form
    //visit form
//    "idx": 7188,
//    "lat": 37.5727564,
//    "lon": 126.9838815,
//    "thumnailAddr": "http://tong.visitkorea.or.kr/cms/resource/75/399475_image2_1.jpg",
//    "thumnailAddr2": "http://tong.visitkorea.or.kr/cms/resource/75/399475_image3_1.jpg",
//    "name": "Imun Seolnongtang",
//    "liked": false,
//    "tagSet": [
//    "spicy",
//    "group"
//    ],
//    "type": 200
}


func setResponseData(responseObject: NSArray?, list:inout Array<LikeVisitForm>){
    //var tempList: Array<AroundForm> = Array()
    list.removeAll()
    for tempData in responseObject!{
        let tempDict: NSDictionary = tempData as! NSDictionary
        list.append(
            LikeVisitForm.init(
                idx: tempDict.object(forKey: "idx") as? Int,
                name: tempDict.object(forKey: "name") as? String,
                cat1: tempDict.object(forKey: "cat1") as? String,
                cat2: tempDict.object(forKey: "cat2") as? String,
                cat3: tempDict.object(forKey: "cat3") as? String,
                myEvaluation: tempDict.object(forKey: "myEvaluation") as? Int,
                tel: tempDict.object(forKey: "tel") as? String,
                likeCnt: tempDict.object(forKey: "likeCnt") as? Int,
                visitCnt: tempDict.object(forKey: "visitCnt") as? Int,
                reviewCnt: tempDict.object(forKey: "reviewCnt") as? Int,
                lat: tempDict.object(forKey: "lat") as? Double,
                lon: tempDict.object(forKey: "lon") as? Double,
                addr: tempDict.object(forKey: "addr") as? String,
                summary: tempDict.object(forKey: "summary") as? String,
                detail: tempDict.object(forKey: "detail") as? String,
                homepage: tempDict.object(forKey: "homepage") as? String,
                thumnailAddr: tempDict.object(forKey: "thumnailAddr") as? String,
                type: tempDict.object(forKey: "type") as? Int,
                tagSet: tempDict.object(forKey: "tagSet") as? Array<String>,
                liked: tempDict.object(forKey: "liked") as? Bool
            )
        )
    }
//    print("User.setResponseData: ",list)
    //list.append(tempList)
}
