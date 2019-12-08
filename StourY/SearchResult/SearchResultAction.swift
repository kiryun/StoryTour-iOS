//
//  SearchResultAction.swift
//  StourY
//
//  Created by 김기현 on 15/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension SearchResultVC{
    @objc func tappedBack(btn: UIButton){
        print("SearchResultVC.tappedBack")
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func tappedSearch(btn: UIButton){
        print("SearchResultVC.tappedSearch")
        self.arrayParams["query"] = self.searchBarText.text
        self.searchBarText.endEditing(true)
        self.getList()
    }
    
    func tappedReturn(){
        print("SearchResultVC.tappedSearch")
        self.arrayParams["query"] = self.searchBarText.text
        self.getList()
    }
    
    @objc func tappedSetupFilter(btn: UIButton){
        print("SearchResultVC.tappedSetupFilter")
//        let searchFilterVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchFilterVC") as! SearchFilterVC
//
//        self.present(searchFilterVC, animated: true, completion: nil)
        self.viewBackgroundFilter.isHidden = false
        self.viewFilter.isHidden = false
        UIView.animate(withDuration: 0.2) {
            self.viewFilter.frame.origin.y = self.view.frame.height - self.viewFilter.frame.height
            self.viewBottom.isHidden = false
        }
    }
    
    @objc func tappedConfirmFilter(btn: UIButton){
        print("SearchResultVC.tappedConfirmFilter")
        
        
//        UIView.animate(withDuration: 0.2, animations: {
//            self.viewFilter.frame.origin.y = self.view.frame.height
//            self.viewFilter.isHidden = true
//        }) { (true) in
//            self.viewBottom.isHidden = true
//            self.viewBackgroundFilter.isHidden = true
//        }
        UIView.animate(withDuration: 0.2) {
            self.viewBottom.isHidden = true
            self.viewBackgroundFilter.isHidden = true
            self.viewFilter.frame.origin.y = self.view.frame.height
            self.viewFilter.isHidden = true
        }
        
        var str_locationLat = ""
        var str_locationLon = ""
        var str_category = ""
        for each in self.arraySelectLocation{
            str_locationLat = str_locationLat+"\(self.arrayTagsLocationLat[each])_"
            str_locationLon = str_locationLon+"\(self.arrayTagsLocationLon[each])_"
        }
        for each in self.arraySelectCategory{
            str_category = str_category+"\(self.arrayTagsCategory[each])_"
        }
        self.arrayParams["lat"] = str_locationLat
        self.arrayParams["lon"] = str_locationLon
        self.arrayParams["category"] = str_category
       
        self.getList()
        
    }
    
    @objc func tappedTagLocation(btn: UIButton){
        print("SearchResultVC.tappedTagLocation wasTapped?: index:", btn.tag / 100, btn.tag - 100)
        //1일때 클릭 아직 안된거
        //0일때 클릭 되있는 거
        
//        let idx = btn.tag - 100
        let wasTapped = btn.tag / 100
        
        if wasTapped == 1{
            btn.backgroundColor = identityColor()
            btn.setTitleColor(.white, for: .normal)
            btn.tag = btn.tag - 100
            self.arraySelectLocation.append(btn.tag)
        }else{
            btn.backgroundColor = .white
            btn.setTitleColor(.black, for: .normal)
//            self.arraySelectLocation.removeㄴ
            self.arraySelectLocation.remove(object: btn.tag)
            btn.tag = btn.tag + 100
        }
        print(self.arraySelectLocation)
    }
    
    @objc func tappedTagCategory(btn: UIButton){
        print("SearchResultVC.tappedTagCategory wasTapped?: index:", btn.tag / 100, btn.tag - 100)
        
//        let idx = btn.tag - 100
        let wasTapped = btn.tag / 100
        
        if wasTapped == 1{//1일때 클릭 아직 안된거
            btn.backgroundColor = identityColor()
            btn.setTitleColor(.white, for: .normal)
            btn.tag = btn.tag - 100
            self.arraySelectCategory.append(btn.tag)
        }else{//0일때 클릭 되있는 거
            btn.backgroundColor = .white
            btn.setTitleColor(.black, for: .normal)
            self.arraySelectCategory.remove(object: btn.tag)
            btn.tag = btn.tag + 100
        }
        print(self.arraySelectCategory)
    }
    
    @objc func tappedReset(btn: UIButton){
        print("SearchResultVC.tappedReset")
        for each in self.viewTagsLocation.tagArray{
            if each.tag <= 100{
                each.backgroundColor = .white
                each.setTitleColor(.black, for: .normal)
                self.arraySelectLocation.remove(object: each.tag)
                each.tag = each.tag + 100
            }
        }
        for each in self.viewTagsCategory.tagArray{
            if each.tag <= 100{
                each.backgroundColor = .white
                each.setTitleColor(.black, for: .normal)
                self.arraySelectCategory.remove(object: each.tag)
                each.tag = each.tag + 100
            }
        }
        print(self.arraySelectLocation)
        print(self.arraySelectCategory)
    }
    
    @objc func tappedLike(btn: UIButton){
        print("SearchResultVC.tappedLike")
        var likeParam: Dictionary<String,Any> = Dictionary()
        let userIdx = User.sharedUser.userIdx
        let attrIdx = self.arraySearchResult[btn.tag].idx!
        let currentLike = self.arraySearchResult[btn.tag].liked!
        
        likeParam["userIdx"] = userIdx
        likeParam["attractionIdx"] = attrIdx
//        print(currentLike)
        if currentLike{
            //좋아요 해제 수행
            ApiClient.sharedApiClient.delLike(params: likeParam) { (res, err) in
                if err == nil{
                    print("success del like")
                    if res?.object(forKey: "code") as! Int == 1{
                        btn.setImage(#imageLiteral(resourceName: "btn_heart_off"), for: .normal) // 좋아요 버튼 해제이미지
                        self.arraySearchResult[btn.tag].liked = false // 현재 tableList의 liked를 false
                        
                        //UserLike 업데이트
                        ApiClient.sharedApiClient.getLikeList(completionHandler: { (res, err) in
                            if err == nil{
                                print("success get likeList")
                                setResponseData(responseObject: res, list: &User.sharedUser.likeList)
                                self.tableView.reloadData()
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
                        self.arraySearchResult[btn.tag].liked = true
                        
                        //UserLike 업데이트
                        ApiClient.sharedApiClient.getLikeList(completionHandler: { (res, err) in
                            if err == nil{
                                print("success get likeList")
                                setResponseData(responseObject: res, list: &User.sharedUser.likeList)
                                self.tableView.reloadData()
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
