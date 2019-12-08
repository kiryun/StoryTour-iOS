//
//  MyPageAction.swift
//  StourY
//
//  Created by 김기현 on 26/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension MyPageVC{
    @objc func onChangeOfSegment(_ sender: NavigationSegmentController){
        print("onChangeOfSegment in MyPage")
        self.loadingTableView.startAnimating()
        switch sender.selectedSegmentIndex{
        case 0:
            print("0")
            self.nowList = User.sharedUser.likeList
            self.segmentctrl.changeSelectedButton(nowSelect: 0)
        case 1:
            print("1")
            self.nowList = User.sharedUser.visitList
//            print(self.nowList) // 아무것도 없음
            self.segmentctrl.changeSelectedButton(nowSelect: 1)
        default:
            break
        }
        self.arrayImage.removeAll()
        for i in 0 ..< self.nowList.count{
            self.arrayImage.append(getImageFromURL(strURL: self.nowList[i].thumnailAddr!))
        }
        self.loadingTableView.stopAnimating()
        self.tableView.reloadData()
    }
    
    @objc func loadSettingVC(_ sender: UIButton){
        print("loadSearchView")
        let settingVC = self.storyboard?.instantiateViewController(withIdentifier: "MyPageSettingVC") as! MyPageSettingVC
        
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    //
    @objc func tappedLike(btn: UIButton){
        print("MyPageVC.tappedLike")
        var likeParam: Dictionary<String,Any> = Dictionary()
        let userIdx = User.sharedUser.userIdx
        let attrIdx = self.nowList[btn.tag].idx!
        let currentLike = self.nowList[btn.tag].liked!
        
        likeParam["userIdx"] = userIdx
        likeParam["attractionIdx"] = attrIdx
        print(currentLike)
        if currentLike{
            //좋아요 해제 수행
            ApiClient.sharedApiClient.delLike(params: likeParam) { (res, err) in
                if err == nil{
                    print("success del like")
                    if res?.object(forKey: "code") as! Int == 1{
                        btn.setImage(UIImage(named: "btn_heart_off_line"), for: .normal) // 좋아요 버튼 해제이미지
                        self.nowList[btn.tag].liked = false // 현재 tableList의 liked를 false
//                        switch btn.userData{
//                        case 0:
//                            self.nowList[btn.tag].liked = false
//                        case 1:
//                            self.nowList[btn.tag].liked = false
//                        case 2:
//                            self.nowList[btn.tag].liked = false
//                        default:
//                            break
//                        }
                        //UserLike 업데이트
                        self.updateLikeVisitList()
                        
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
                        btn.setImage(UIImage(named: "btn_heart_on"), for: .normal)
                        self.nowList[btn.tag].liked = true
//                        switch btn.userData{
//                        case 0:
//                            self.nowList[btn.tag].liked = true
//                        case 1:
//                            self.nowList[btn.tag].liked = true
//                        case 2:
//                            self.nowList[btn.tag].liked = true
//                        default:
//                            break
//                        }
                        
                        //UserLike visit 업데이트
                        self.updateLikeVisitList()
                        
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
    
    func updateLikeVisitList(){
        ApiClient.sharedApiClient.getLikeList(completionHandler: { (res, err) in
            if err == nil{
                print("success get likeList")
                setResponseData(responseObject: res, list: &User.sharedUser.likeList)
                self.tableView.reloadData()
            }else{
                print("get likeList fail!")
            }
        })
        ApiClient.sharedApiClient.getVisitList(completionHandler: { (res, err) in
            if err == nil{
                print("success get visitList")
                setResponseData(responseObject: res, list: &User.sharedUser.visitList)
                self.tableView.reloadData()
            }else{
                print("get visitList fail!")
            }
        })
    }
}
