//
//  HomeGet.swift
//  StourY
//
//  Created by 김기현 on 03/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

extension HomeVC{
    //테이블 데이터
    func getAtrr(){
        if Reachability.isConnectedToNetwork(){
            self.loadingTableView.startAnimating()
            switch self.nowSelectedTable{
            case -1: //처음 시작 했다면
                ApiClient.sharedApiClient.getPersonalRecommandAttr(lat: self.lat, lon: self.lon, page: self.recommandPageCnt) { (res, err) in
                    if err == nil{
                        print("success get recommand, recommandPageCnt: ",self.recommandPageCnt)
                        self.resSuccess = true
                        setResponseData(responseObject: res, list: &self.recommandList, imgList: &self.arrayTableImageList)
                        //                    if self.recommandPageCnt == 1{
                        //                        print("recommandPageCnt == 1")
                        //                        self.nowTableList = self.recommandList
                        //                        self.tableView.reloadData()
                        //                    }
                        self.recommandPageCnt += 1
                        self.nowTableList = self.recommandList
                        //                    loading.stopAnimating()
                        //                    self.collectionView.reloadData()
                        self.loadingTableView.stopAnimating()
                        
                        if self.nowTableList.count == 0{ //근처에 여행지가 하나도 없다면
                            User.sharedUser.lat = 37.579108
                            User.sharedUser.lon = 126.990957
                            self.lat = 37.579108
                            self.lon = 126.990957
                            switch User.sharedUser.language{
                            case 0:
                                ToastView.shared.short(self.view, txt_msg: "There are no nearby destinations. It is set as the default destination.")
                            case 1:
                                ToastView.shared.short(self.view, txt_msg: "주변에 여행지가 없습니다. 기본 여행지로 설정됩니다.")
                            default:
                                ToastView.shared.short(self.view, txt_msg: "There are no nearby destinations. It is set as the default destination.")
                            }
                            self.getAtrr()
                        }else{
                            self.getNextPageCnt() // 다음 페이지의 cell갯수를 받아옴
                            self.tableView.reloadData()
                        }
                        
                    }
                    else{
                        print("recommandList fail!")
                    }
                }
                ApiClient.sharedApiClient.getTours(lat: self.lat, lon: self.lon, page: self.tourPageCnt) { (res, err) in
                    if err == nil{
                        print("success get mainTour, tourPageCnt: ", self.tourPageCnt)
                        self.resSuccess = true
                        setResponseData(responseObject: res, list: &self.mainTourList, imgList: &self.arrayTableTourImageList)
                        self.tourPageCnt += 1
                        self.getNextPageCnt() // 다음 페이지의 cell갯수를 받아옴
                    }
                    else{
                        print("tourList fail!")
                    }
                }
                ApiClient.sharedApiClient.getRestaurants(lat: self.lat, lon: self.lon, page: self.restaurantPageCnt) { (res, err) in
                    if err == nil{
                        print("success get mainRestaurants, restaurantPageCnt: ", self.restaurantPageCnt)
                        self.resSuccess = true
                        setResponseData(responseObject: res, list: &self.mainRestaurantList, imgList: &self.arrayTableRestaurantImageList)
                        self.restaurantPageCnt += 1
                        self.getNextPageCnt() // 다음 페이지의 cell갯수를 받아옴
                    }
                    else{
                        print("restaurants fail!")
                    }
                }
            case 0:
                ApiClient.sharedApiClient.getPersonalRecommandAttr(lat: self.lat, lon: self.lon, page: self.recommandPageCnt) { (res, err) in
                    if err == nil{
                        print("success get recommand, recommandPageCnt: ",self.recommandPageCnt)
                        self.resSuccess = true
                        setResponseData(responseObject: res, list: &self.recommandList, imgList: &self.arrayTableImageList)
                        //                    if self.recommandPageCnt == 1{
                        //                        print("recommandPageCnt == 1")
                        //                        self.nowTableList = self.recommandList
                        //                        self.tableView.reloadData()
                        //                    }
                        self.recommandPageCnt += 1
                        self.nowTableList = self.recommandList
                        self.loadingTableView.stopAnimating()
                        //                    self.collectionView.reloadData()
                        self.tableView.reloadData()
                        self.getNextPageCnt() // 다음 페이지의 cell갯수를 받아옴
                    }
                    else{
                        print("recommandList fail!")
                    }
                }
            case 1:
                ApiClient.sharedApiClient.getTours(lat: self.lat, lon: self.lon, page: self.tourPageCnt) { (res, err) in
                    if err == nil{
                        print("success get mainTour, tourPageCnt: ", self.tourPageCnt)
                        self.resSuccess = true
                        setResponseData(responseObject: res, list: &self.mainTourList, imgList: &self.arrayTableTourImageList)
                        self.tourPageCnt += 1
                        self.nowTableList = self.mainTourList
                        self.loadingTableView.stopAnimating()
                        self.tableView.reloadData()
                        self.getNextPageCnt() // 다음 페이지의 cell갯수를 받아옴
                    }
                    else{
                        print("tourList fail!")
                    }
                }
            case 2:
                ApiClient.sharedApiClient.getRestaurants(lat: self.lat, lon: self.lon, page: self.restaurantPageCnt) { (res, err) in
                    if err == nil{
                        print("success get mainRestaurants, restaurantPageCnt: ", self.restaurantPageCnt)
                        self.resSuccess = true
                        setResponseData(responseObject: res, list: &self.mainRestaurantList, imgList: &self.arrayTableRestaurantImageList)
                        self.restaurantPageCnt += 1
                        self.nowTableList = self.mainRestaurantList
                        self.loadingTableView.stopAnimating()
                        self.tableView.reloadData()
                        self.getNextPageCnt() // 다음 페이지의 cell갯수를 받아옴
                    }
                    else{
                        print("restaurants fail!")
                    }
                }
            default:
                break
            }
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
        
        
    }
    
    //collection view 데이터
    func getMainRecommand(){
        if Reachability.isConnectedToNetwork(){
            ApiClient.sharedApiClient.getMainRecommandAttr(lat: self.lat, lon: self.lon, page: self.intMainRecommandPageCnt) { (res, err) in
                if err == nil{
                    print("success get MainRecommands")
                    self.resSuccess = true
                    setResponseData(responseObject: res, list: &self.arrayMainRecommand, imgList: &self.arrayCollectionImageList)
                    self.intMainRecommandPageCnt += 1
                    self.loadingCollectionView.stopAnimating()
                    self.collectionView.reloadData()
                    self.getNextPageCnt() // 다음 페이지의 cell갯수를 받아옴
                }else{
                    print("main recommand fail!")
                }
            }
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
        
        
    }
    
    func getNextPageCnt(){
        if Reachability.isConnectedToNetwork(){
            switch self.viewSegmentCtrl.selectedSegmentIndex {
            case 0:
                ApiClient.sharedApiClient.getPersonalRecommandAttr(lat: self.lat, lon: self.lon, page: self.recommandPageCnt, completionHandler: { (res, err) in
                    if err == nil{
                        print("success get recommandPageCnt")
                        self.arrayNextTablePageCnt[0] = (res?.count)!
                    }else{
                        print("get recommandPageCnt Fail")
                    }
                })
            case 1:
                ApiClient.sharedApiClient.getTours(lat: self.lat, lon: self.lon, page: self.tourPageCnt) { (res, err) in
                    if err == nil{
                        print("success get tourPageCnt")
                        self.arrayNextTablePageCnt[1] = (res?.count)!
                    }else{
                        print("get tourPageCnt Fail")
                    }
                }
            case 2:
                ApiClient.sharedApiClient.getRestaurants(lat: self.lat, lon: self.lon, page: self.restaurantPageCnt) { (res, err) in
                    if err == nil{
                        print("success get restaurantsPageCnt")
                        self.arrayNextTablePageCnt[2] = (res?.count)!
                    }else{
                        print("get restaurantsPageCnt Fail")
                    }
                }
            default:
                break
            }
            
            ApiClient.sharedApiClient.getMainRecommandAttr(lat: self.lat, lon: self.lon, page: self.intMainRecommandPageCnt) { (res, err) in
                if err == nil{
                    print("success get mainRecommandPageCnt")
                    self.arrayNextTablePageCnt[3] = (res?.count)!
                }else{
                    print("get mainRecommand Fail")
                }
            }
            
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
        
    }
    
}
