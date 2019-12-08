//
//  DetailUpdateRequest.swift
//  StourY
//
//  Created by 김기현 on 06/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension DetailVC{
    func updateVisitList(){
        //UserVisit 업데이트
        ApiClient.sharedApiClient.getVisitList(completionHandler: { (res, err) in
            if err == nil{
                print("success get visitList")
                setResponseData(responseObject: res, list: &User.sharedUser.visitList)
            }else{
                print("get visitList fail!")
            }
        })
    }
}
