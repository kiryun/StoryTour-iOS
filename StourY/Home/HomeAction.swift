//
//  HomeAction.swift
//  StourY
//
//  Created by 김기현 on 03/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension HomeVC{
    @objc func loadSearchVC(_ sender: UIButton){
        print("loadSearchView")
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        searchVC.lat = self.lat
        searchVC.lon = self.lon
        
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc func tappedCurrentGPSButton(_ btn: UIButton){
        print("tappedCurrentGPSButton")
        
        switch User.sharedUser.language {
        case 0:
            btn.setTitle("Completed setup", for: .normal)
        case 1:
            btn.setTitle("설정 완료", for: .normal)
        default:
            btn.setTitle("Completed setup", for: .normal)
        }
        
        let homeMapVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeMapVC") as! HomeMapVC
        
        navigationController?.pushViewController(homeMapVC, animated: true)
    }
    
    @objc func onChangeOfViewSegment(_ sender: CustomSegmentControl){
        switch sender.selectedSegmentIndex{
        case 0:
            print("0")
            self.nowTableList = self.recommandList
            self.naviBarSegmentctrl.changeSelectedButton(nowSelect: 0)
            self.nowSelectedTable = 0
        case 1:
            print("1")
            self.nowTableList = self.mainTourList
            self.naviBarSegmentctrl.changeSelectedButton(nowSelect: 1)
            self.nowSelectedTable = 1
        case 2:
            print("2")
            self.nowTableList = self.mainRestaurantList
            self.naviBarSegmentctrl.changeSelectedButton(nowSelect: 2)
            self.nowSelectedTable = 2
        default:
            break
        }
        self.tableView.reloadData()
    }
    
    @objc func onChangeOfSegment(_ sender: NavigationSegmentController){
        print("onChangeOfSegment")
        print(self.visibleNaviBar)
        if !self.visibleNaviBar{
            switch sender.selectedSegmentIndex{
            case 0:
                print("0")
                self.nowTableList = self.recommandList
                self.viewSegmentCtrl.changeSelectedButton(nowSelect: 0)
                self.nowSelectedTable = 0
            case 1:
                print("1")
                self.nowTableList = self.mainTourList
                self.viewSegmentCtrl.changeSelectedButton(nowSelect: 1)
                self.nowSelectedTable = 1
            case 2:
                print("2")
                self.nowTableList = self.mainRestaurantList
                self.viewSegmentCtrl.changeSelectedButton(nowSelect: 2)
                self.nowSelectedTable = 2
            default:
                break
            }
            self.tableView.reloadData()
        }
    }
    
    @objc func tappedLike(btn: UIButton) {
        print("HomeVC.tappedLike")
        var likeParam: Dictionary<String,Any> = Dictionary()
        let userIdx = User.sharedUser.userIdx
        let attrIdx = self.nowTableList[btn.tag].idx!
        let currentLike = self.nowTableList[btn.tag].liked!
        
        likeParam["userIdx"] = userIdx
        likeParam["attractionIdx"] = attrIdx
        print(currentLike)
        if currentLike{
            //좋아요 해제 수행
            ApiClient.sharedApiClient.delLike(params: likeParam) { (res, err) in
                if err == nil{
                    print("success del like")
                    if res?.object(forKey: "code") as! Int == 1{
                        btn.setImage(#imageLiteral(resourceName: "btn_heart_off"), for: .normal) // 좋아요 버튼 해제이미지
                        self.nowTableList[btn.tag].liked = false // 현재 tableList의 liked를 false
                        switch btn.userData{
                        case 0:
                            self.recommandList[btn.tag].liked = false
                        case 1:
                            self.mainTourList[btn.tag].liked = false
                        case 2:
                            self.mainRestaurantList[btn.tag].liked = false
                        default:
                            break
                        }
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
                        btn.setImage(#imageLiteral(resourceName: "btn_heart_on"), for: .normal)
                        self.nowTableList[btn.tag].liked = true
                        switch btn.userData{
                        case 0:
                            self.recommandList[btn.tag].liked = true
                        case 1:
                            self.mainTourList[btn.tag].liked = true
                        case 2:
                            self.mainRestaurantList[btn.tag].liked = true
                        default:
                            break
                        }
                        
                        //UserLike 업데이트
                        ApiClient.sharedApiClient.getLikeList(completionHandler: { (res, err) in
                            if err == nil{
                                print("success get likeList")
                                setResponseData(responseObject: res, list: &User.sharedUser.likeList)
//                                self.tableView.reloadData()
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
}
