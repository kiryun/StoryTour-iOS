//
//  DetailAction.swift
//  StourY
//
//  Created by 김기현 on 19/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension DetailVC{
    
    //more detail
    @objc func tappedMoreDetail(btn: UIButton){
        print("DetailVC.tappedMoreDetail")
        if btn.tag == 0{
            //펼치기
            self.detailText.numberOfLines = 0
            self.detailText.sizeToFit()
            switch User.sharedUser.language{
            case 0:
                btn.setTitle("Less", for: .normal)
            case 1:
                btn.setTitle("간략히", for: .normal)
            default:
                btn.setTitle("Less", for: .normal)
            }
            btn.tag = 1
        }else{
            //닫기
            self.detailText.numberOfLines = 4
            self.detailText.sizeToFit()
            switch User.sharedUser.language{
            case 0:
                btn.setTitle("More", for: .normal)
            case 1:
                btn.setTitle("더보기", for: .normal)
            default:
                btn.setTitle("More", for: .normal)
            }
            btn.tag = 0
            
        }
    }
    
    @objc func tappedMorePrice(btn: UIButton){
        print("DetailVC.tappedMorePrice")
        
        if btn.tag == 0{
            //펼치기
            //            self.menuDetail.text = self.detailDict["menu"] as? String
            self.labelPriceDetail.numberOfLines = 0
            self.labelPriceDetail.sizeToFit()
            
            switch User.sharedUser.language{
            case 0:
                btn.setTitle("Less", for: .normal)
            case 1:
                btn.setTitle("간략히", for: .normal)
            default:
                btn.setTitle("Less", for: .normal)
            }
            btn.tag = 1
        }else{
            //닫기
            //            self.menuDetail.text = self.detailDict["mainMenu"] as? String
            self.labelPriceDetail.numberOfLines = 4
            self.labelPriceDetail.sizeToFit()
            switch User.sharedUser.language{
            case 0:
                btn.setTitle("More", for: .normal)
            case 1:
                btn.setTitle("더보기", for: .normal)
            default:
                btn.setTitle("More", for: .normal)
            }
            btn.tag = 0
            
        }
    }
    
    //more Use Time
    @objc func tappedMoreUseTime(btn: UIButton){
        print("DetailVC.tappedMoreUseTime")
        
        if btn.tag == 0{
            //펼치기
            //            self.menuDetail.text = self.detailDict["menu"] as? String
            self.labelUseTimeDetail.numberOfLines = 0
            self.labelUseTimeDetail.sizeToFit()
            
            switch User.sharedUser.language{
            case 0:
                btn.setTitle("Less", for: .normal)
            case 1:
                btn.setTitle("간략히", for: .normal)
            default:
                btn.setTitle("Less", for: .normal)
            }
            btn.tag = 1
        }else{
            //닫기
            //            self.menuDetail.text = self.detailDict["mainMenu"] as? String
            self.labelUseTimeDetail.numberOfLines = 4
            self.labelUseTimeDetail.sizeToFit()
            switch User.sharedUser.language{
            case 0:
                btn.setTitle("More", for: .normal)
            case 1:
                btn.setTitle("더보기", for: .normal)
            default:
                btn.setTitle("More", for: .normal)
            }
            btn.tag = 0
            
        }
    }
    
    //more menu
    @objc func tappedMoreMenu(btn: UIButton){
        print("DetailVC.tappedMoreMenu")
        
        if btn.tag == 0{
            //펼치기
            //            self.menuDetail.text = self.detailDict["menu"] as? String
            self.menuDetail.numberOfLines = 0
            self.menuDetail.sizeToFit()
            
            switch User.sharedUser.language{
            case 0:
                btn.setTitle("Less", for: .normal)
            case 1:
                btn.setTitle("간략히", for: .normal)
            default:
                btn.setTitle("Less", for: .normal)
            }
            btn.tag = 1
        }else{
            //닫기
            //            self.menuDetail.text = self.detailDict["mainMenu"] as? String
            self.menuDetail.numberOfLines = 2
            self.menuDetail.sizeToFit()
            switch User.sharedUser.language{
            case 0:
                btn.setTitle("More", for: .normal)
            case 1:
                btn.setTitle("더보기", for: .normal)
            default:
                btn.setTitle("More", for: .normal)
            }
            btn.tag = 0
            
        }
    }
    
    //more operation time
    @objc func tappedMoreOperationTime(btn: UIButton){
        print("DetailVC.tappedMoreOperationTime")
        
        if btn.tag == 0{
            //펼치기
            //            self.menuDetail.text = self.detailDict["menu"] as? String
            self.labelOperationTimeDetail.numberOfLines = 0
            self.labelOperationTimeDetail.sizeToFit()
            
            switch User.sharedUser.language{
            case 0:
                btn.setTitle("Less", for: .normal)
            case 1:
                btn.setTitle("간략히", for: .normal)
            default:
                btn.setTitle("Less", for: .normal)
            }
            btn.tag = 1
        }else{
            //닫기
            //            self.menuDetail.text = self.detailDict["mainMenu"] as? String
            self.labelOperationTimeDetail.numberOfLines = 2
            self.labelOperationTimeDetail.sizeToFit()
            switch User.sharedUser.language{
            case 0:
                btn.setTitle("More", for: .normal)
            case 1:
                btn.setTitle("더보기", for: .normal)
            default:
                btn.setTitle("More", for: .normal)
            }
            btn.tag = 0
            
        }
    }
    
    //direction in google maps
    @objc func tappedDirection(btn: UIButton){
        //Working in Swift new versions.
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!))
        {
            let strUrl = "comgooglemaps://?saddr=&daddr=\(Float(self.lat)),\(Float(self.lon))&directionsmode=driving"
            UIApplication.shared.open(NSURL(string: strUrl)! as URL, options: [:], completionHandler: nil)
//            UIApplication.shared.openURL(NSURL(string: "comgooglemaps://?saddr=&daddr=\(Float(self.lat)),\(Float(self.lon))&directionsmode=driving")! as URL)
        } else
        {
            NSLog("Can't use com.google.maps://");
        }
    }
    
    //back
    @objc func tappedBack(btn: UIButton){
        print("DetailVC.tappedBack")
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    //like visit
    @objc func tappedLike(gesture: UITapGestureRecognizer){
        print("DetailVC.tappedLike")
        var likeParam: Dictionary<String,Any> = Dictionary()
        let userIdx = User.sharedUser.userIdx
        let attrIdx = self.detailDict["idx"] as! Int
        let currentLike = self.detailDict["liked"] as! Bool
        
        likeParam["userIdx"] = userIdx
        likeParam["attractionIdx"] = attrIdx
        
        if currentLike{
            //좋아요 해제 수행
            ApiClient.sharedApiClient.delLike(params: likeParam) { (res, err) in
                if err == nil{
                    print("success del like")
                    if res?.object(forKey: "code") as! Int == 1{
                        self.imageViewLike.image = UIImage(named: "icon_like_off")
                        self.labelLike.textColor = .black
                        self.viewLike.backgroundColor = .white
                        self.detailDict["liked"] = false
                        //UserLike 업데이트
                        ApiClient.sharedApiClient.getLikeList(completionHandler: { (res, err) in
                            if err == nil{
                                print("success get likeList")
                                setResponseData(responseObject: res, list: &User.sharedUser.likeList)
                            }else{
                                print("get likeList fail!")
                            }
                        })
                    }else{
                        print("del like return code is 2")
                    }
                }else{
                    print("del like fail!")
                }
            }
        }else{
            //좋아요 수행
            ApiClient.sharedApiClient.postLike(params: likeParam) { (res, err) in
                if err == nil{
                    print("success post like")
                    if res?.object(forKey: "code") as! Int == 1{
                        self.imageViewLike.image = UIImage(named: "icon_like_on")
                        self.labelLike.textColor = .white
                        self.viewLike.backgroundColor = identityColor()
                        self.detailDict["liked"] = true
                        //UserLike 업데이트
                        ApiClient.sharedApiClient.getLikeList(completionHandler: { (res, err) in
                            if err == nil{
                                print("success get likeList")
                                setResponseData(responseObject: res, list: &User.sharedUser.likeList)
                            }else{
                                print("get likeList fail!")
                            }
                        })
                    }else{
                        print("pos like return code is 2")
                    }
                }
                else{
                    print("post like fail!")
                }
            }
        }
        
    }
    
    @objc func tappedVisit(gesture: UITapGestureRecognizer){
        print("DetailVC.tappedVisit")
        var visitParam: Dictionary<String,Any> = Dictionary()
        let userIdx = User.sharedUser.userIdx
        let attrIdx = self.detailDict["idx"] as! Int
        let currentVisit = self.detailDict["visited"] as! Bool
        
        visitParam["userIdx"] = userIdx
        visitParam["attractionIdx"] = attrIdx
        
        if currentVisit{
            //방문 해제 수행
            ApiClient.sharedApiClient.delVisit(params: visitParam) { (res, err) in
                if err == nil{
                    print("success del visit")
                    if res?.object(forKey: "code") as! Int == 1{
                        self.imageViewVisit.image = UIImage(named: "icon_visit_off")
                        self.labelVisit.textColor = .black
                        self.viewVisit.backgroundColor = .white
                        self.detailDict["visited"] = false
                        
                        //UserVisit 업데이트
                        self.updateVisitList()
                    }else{
                        print("del visit return code is 2")
                    }
                }else{
                    print("del visit fail!")
                }
            }
        }else{
            //방문 스코어 선택
            self.viewVisitScoreMaster.isHidden = false
//            //setupView에 있는 버튼도 업데이트 해줘야 함
//            self.updateVisitButton()
        }
    }
    
    @objc func tappedVisitScoreBad(btn: UIButton){
        print("DetailVC.tappedVisitScoreBad")
        var visitParam: Dictionary<String,Any> = Dictionary()
        let userIdx = User.sharedUser.userIdx
        let attrIdx = self.detailDict["idx"] as! Int
        
        visitParam["userIdx"] = userIdx
        visitParam["attractionIdx"] = attrIdx
        
        
        let score = 1
        var param = Dictionary<String, Any>()
        param["attractionIdx"] = self.attrIdx
        param["score"] = score
        
        ApiClient.sharedApiClient.postVisit(params: visitParam) { (res, err) in
            if err == nil{
                print("success post visit")
                if res?.object(forKey: "code") as! Int == 1{
                    ApiClient.sharedApiClient.postVisitScore(params: param) { (res, err) in
                        if err == nil{
                            print("success visit bad score")
                            print(score)
                            self.detailDict["myEvaluation"] = score
                            self.detailDict["visited"] = true
                            self.updateVisitButton()
                            //UserVisit 업데이트
                            self.updateVisitList()
                            
                        }else{
                            print("post visit score bad fail!")
                            //여기에 toast메세지 띄어 실패 했다고
                            ToastView.shared.short(self.view, txt_msg: "Failed to apply visit score.")
                        }
                    }
                    
                }else{
                    print("pos visit return code is 2")
                }
            }
            else{
                print("post visit fail!")
            }
        }
        
        
//        ApiClient.sharedApiClient.postVisitScore(params: param) { (res, err) in
//            if err == nil{
//                print("success visit bad score")
//                print(score)
//                self.detailDict["myEvaluation"] = score
////                self.updateVisitButton()
//                //방문했어요 수행
//                ApiClient.sharedApiClient.postVisit(params: visitParam) { (res, err) in
//                    if err == nil{
//                        print("success post visit")
//                        if res?.object(forKey: "code") as! Int == 1{
//                            self.detailDict["visited"] = true
//                            self.updateVisitButton()
//                            //UserVisit 업데이트
//                            self.updateVisitList()
//                        }else{
//                            print("pos visit return code is 2")
//                        }
//                    }
//                    else{
//                        print("post visit fail!")
//                    }
//                }
//            }else{
//                print("post visit score bad fail!")
//                //여기에 toast메세지 띄어 실패 했다고
//                ToastView.shared.short(self.view, txt_msg: "Failed to apply visit score.")
//            }
//        }
        self.viewVisitScoreMaster.isHidden = true
    }
    
    @objc func tappedVisitScoreFine(btn: UIButton){
        print("DetailVC.tappedVisitScoreFine")
        var visitParam: Dictionary<String,Any> = Dictionary()
        let userIdx = User.sharedUser.userIdx
        let attrIdx = self.detailDict["idx"] as! Int
        
        visitParam["userIdx"] = userIdx
        visitParam["attractionIdx"] = attrIdx
        
        let score = 2
        var param = Dictionary<String, Any>()
        param["attractionIdx"] = self.attrIdx
        param["score"] = score
        
        ApiClient.sharedApiClient.postVisit(params: visitParam) { (res, err) in
            if err == nil{
                print("success post visit")
                if res?.object(forKey: "code") as! Int == 1{
                    ApiClient.sharedApiClient.postVisitScore(params: param) { (res, err) in
                        if err == nil{
                            print("success visit fine score")
                            print(score)
                            self.detailDict["myEvaluation"] = score
                            self.detailDict["visited"] = true
                            self.updateVisitButton()
                            //UserVisit 업데이트
                            self.updateVisitList()
                            
                        }else{
                            print("post visit score fine fail!")
                            //여기에 toast메세지 띄어 실패 했다고
                            ToastView.shared.short(self.view, txt_msg: "Failed to apply visit score.")
                        }
                    }
                    
                }else{
                    print("pos visit return code is 2")
                }
            }
            else{
                print("post visit fail!")
            }
        }
        
//        ApiClient.sharedApiClient.postVisitScore(params: param) { (res, err) in
//            if err == nil{
//                print("success visit fine score")
//
//                self.detailDict["myEvaluation"] = score
//
//                //방문했어요 수행
//                ApiClient.sharedApiClient.postVisit(params: visitParam) { (res, err) in
//                    if err == nil{
//                        print("success post visit")
//                        if res?.object(forKey: "code") as! Int == 1{
////                            self.imageViewVisit.image = UIImage(named: "icon_visit_on")
////                            self.labelVisit.textColor = .white
////                            self.viewVisit.backgroundColor = identityColor()
//                            self.detailDict["visited"] = true
//                            self.updateVisitButton()
//                            //UserVisit 업데이트
//                            self.updateVisitList()
//                        }else{
//                            print("pos visit return code is 2")
//                        }
//                    }
//                    else{
//                        print("post visit fail!")
//                    }
//                }
//            }else{
//                print("post visit score fine fail!")
//                //여기에 toast메세지 띄어 실패 했다고
//                ToastView.shared.short(self.view, txt_msg: "Failed to apply visit score.")
//            }
//        }
        self.viewVisitScoreMaster.isHidden = true
    }
    
    @objc func tappedVisitScoreGood(btn: UIButton){
        print("DetailVC.tappedVisitScoreGood")
        var visitParam: Dictionary<String,Any> = Dictionary()
        let userIdx = User.sharedUser.userIdx
        let attrIdx = self.detailDict["idx"] as! Int
        
        visitParam["userIdx"] = userIdx
        visitParam["attractionIdx"] = attrIdx
        
        let score = 3
        var param = Dictionary<String, Any>()
        param["attractionIdx"] = self.attrIdx
        param["score"] = score
        
        ApiClient.sharedApiClient.postVisit(params: visitParam) { (res, err) in
            if err == nil{
                print("success post visit")
                if res?.object(forKey: "code") as! Int == 1{
                    ApiClient.sharedApiClient.postVisitScore(params: param) { (res, err) in
                        if err == nil{
                            print("success visit good score")
                            print(score)
                            self.detailDict["myEvaluation"] = score
                            self.detailDict["visited"] = true
                            self.updateVisitButton()
                            //UserVisit 업데이트
                            self.updateVisitList()
                            
                        }else{
                            print("post visit score good fail!")
                            //여기에 toast메세지 띄어 실패 했다고
                            ToastView.shared.short(self.view, txt_msg: "Failed to apply visit score.")
                        }
                    }
                    
                }else{
                    print("pos visit return code is 2")
                }
            }
            else{
                print("post visit fail!")
            }
        }
        
//        ApiClient.sharedApiClient.postVisitScore(params: param) { (res, err) in
//            if err == nil{
//                print("success visit good score")
//
//                self.detailDict["myEvaluation"] = score
////                self.updateVisitButton()
//                //방문했어요 수행
//                ApiClient.sharedApiClient.postVisit(params: visitParam) { (res, err) in
//                    if err == nil{
//                        print("success post visit")
//                        if res?.object(forKey: "code") as! Int == 1{
////                            self.imageViewVisit.image = UIImage(named: "icon_visit_on")
////                            self.labelVisit.textColor = .white
////                            self.viewVisit.backgroundColor = identityColor()
//                            self.detailDict["visited"] = true
//                            self.updateVisitButton()
//                            //UserVisit 업데이트
//                            self.updateVisitList()
//                        }else{
//                            print("pos visit return code is 2")
//                        }
//                    }
//                    else{
//                        print("post visit fail!")
//                    }
//                }
//            }else{
//                print("post visit score good fail!")
//                //여기에 toast메세지 띄어 실패 했다고
//                ToastView.shared.short(self.view, txt_msg: "Failed to apply visit score.")
//            }
//        }
        
        self.viewVisitScoreMaster.isHidden = true
    }
    
    //youtube
//    @objc func onTriggerYoutube(sender: UITapGestureRecognizer){
//        print("tap")
//    }
//
//    @objc func tappedMoreVideo(sender: UIButton){
//        print("moreVideo")
//    }
}

//guide audio toon button
extension DetailVC{
    
    //guide button
    @objc func tappedGuide(btn: UIButton){
        if btn.tag == 0{ // 버튼이 현재 안눌린 상태라면
            btn.setImage(UIImage(named: "btn_x"), for: .normal)
            
            self.visibleGuides()
            btn.tag = 1
        }else{ // 눌린 상태라면
            btn.setImage(UIImage(named: "btn_guide"), for: .normal)
            self.hideGuides()
            btn.tag = 0
        }
    }
    
    //toon button
    @objc func tappedToon(btn: UIButton){
        print("DetailVC.tappedGuideToonButton")
        //on trigger view load
        let toonAudioGuideVC = self.storyboard?.instantiateViewController(withIdentifier: "ToonAudioGuideVC") as! ToonAudioGuideVC

        toonAudioGuideVC.attrIdx = self.attrIdx
        toonAudioGuideVC.lat = self.detailDict["lat"] as! Double
        toonAudioGuideVC.lon = self.detailDict["lon"] as! Double
        toonAudioGuideVC.intFirstSegementVal = 1
        self.present(toonAudioGuideVC, animated: true, completion: nil)
        
    }
    
    //audio button
    @objc func tappedAudio(btn: UIButton){
        print("DetailVC.tappedGuideAudioButton")
        
        //on trigger view load
        let toonAudioGuideVC = self.storyboard?.instantiateViewController(withIdentifier: "ToonAudioGuideVC") as! ToonAudioGuideVC

        toonAudioGuideVC.attrIdx = self.attrIdx
        toonAudioGuideVC.lat = self.detailDict["lat"] as! Double
        toonAudioGuideVC.lon = self.detailDict["lon"] as! Double
        toonAudioGuideVC.intFirstSegementVal = 0

        self.present(toonAudioGuideVC, animated: true, completion: nil)
//        self.present(toonAudioGuideVC, animated: true, completion: nil)
    }
    
    //filterView
    @objc func tappedFilterView(gesture: UITapGestureRecognizer){
        print("tapped filterView")
        self.hideGuides()
        self.guideButton.setImage(UIImage(named: "btn_guide"), for: .normal)
        self.guideButton.tag = 0
    }
    
    func hideGuides(){
        self.filterView.backgroundColor = .clear
        self.filterView.removeFromSuperview()
        
        //guide button
        self.view.addSubview(self.guideButton)
        self.guideButton.snp.removeConstraints()
        self.guideButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.20)//55/360
            make.right.equalTo(self.view).offset(self.screenFrameWidth * -0.09)//32/360
            make.bottom.equalTo(self.view).offset(self.screenFrameWidth * -0.1)//37/360
        }
        
        //guide Toon Button
        self.guideToonButton.alpha = 0.0
        self.guideToonButton.snp.removeConstraints()
        self.guideToonButton.removeFromSuperview()
        
        //guideAudio button
        self.guideAudioButton.alpha = 0.0
        self.guideAudioButton.snp.removeConstraints()
        self.guideAudioButton.removeFromSuperview()
    }
    
    func visibleGuides(){
        self.filterView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.view.addSubview(self.filterView)
        
        self.filterView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.width.height.equalTo(self.view)
        }
        let filterViewGesture = UITapGestureRecognizer(target: self, action:  #selector (self.tappedFilterView(gesture:)))
        self.filterView.addGestureRecognizer(filterViewGesture)
        
        self.filterView.addSubview(self.guideButton)
        
        self.guideToonButton.alpha = 1.0
        self.guideToonButton.snp.removeConstraints()
        self.filterView.addSubview(self.guideToonButton)
        self.guideToonButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.20)//50/360
            make.right.equalTo(self.view).offset(self.screenFrameWidth * -0.09)//34/360
            make.bottom.equalTo(self.view).offset(self.screenFrameWidth * -0.3)//107/360
        }
        
        self.guideAudioButton.alpha = 1.0
        self.guideAudioButton.snp.removeConstraints()
        self.filterView.addSubview(self.guideAudioButton)
        self.guideAudioButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.20)//50/360
            make.right.equalTo(self.view).offset(self.screenFrameWidth * -0.09)//34/360
            make.bottom.equalTo(self.view).offset(self.screenFrameWidth * -0.48)//172/360
        }
    }
    
}
