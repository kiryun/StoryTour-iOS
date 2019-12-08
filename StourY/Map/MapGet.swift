//
//  MapGet.swift
//  StourY
//
//  Created by 김기현 on 09/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension MapVC{
    func getAtrr(intSegmentIdx: Int){
        if Reachability.isConnectedToNetwork(){
            switch intSegmentIdx {
            case 0: //관광지
                ApiClient.sharedApiClient.getTours(lat: self.lat, lon: self.lon, page: self.intTourPageCount) { (res, err) in
                    if err == nil{
                        print("MapVC.success get tours")
                        self.arrayTourList.removeAll()
                        self.arrayTourImage.removeAll()
                        setResponseData(responseObject: res, list: &self.arrayTourList, imgList: &self.arrayTourImage)
                        //                    print(self.arrayMarkerList)
                        //                    self.intTourPageCount += 1
                        
                        //                    self.arrayCurrentList = self.arrayTourList
                        self.createMarkers()
                        if self.arrayTourList.count != 0{
                            
                            self.containerViewCollection.isHidden = false
                            //                        self.viewPager.reloadData()
                            self.mapCollection.arrayImage = self.arrayTourImage
                            self.mapCollection.dataSource = self.arrayTourList // datasource가 가장 마지막에 set 되어야 함
                            
                        }else{
                            self.containerViewCollection.isHidden = true
                        }
                    }else{
                        
                    }
                }
            case 1: //맛집
                ApiClient.sharedApiClient.getRestaurants(lat: self.lat, lon: self.lon, page: self.intFoodPageCount) { (res, err) in
                    if err == nil{
                        print("MapVC.success get food")
                        self.arrayFoodList.removeAll()
                        self.arrayFoodImage.removeAll()
                        setResponseData(responseObject: res, list: &self.arrayFoodList, imgList: &self.arrayFoodImage)
                        
                        //                    self.intFoodPageCount += 1
                        
                        //                    self.locationManager.requestWhenInUseAuthorization()
                        //                    self.locationManager.startUpdatingLocation()
                        //                    self.arrayCurrentList = self.arrayTourList
                        self.createMarkers()
                        if self.arrayFoodList.count != 0{
                            self.containerViewCollection.isHidden = false
                            self.mapCollection.arrayImage = self.arrayFoodImage
                            self.mapCollection.dataSource = self.arrayFoodList // datasource가 가장 마지막에 set 되어야 함
                        }
                    }else{
                        self.containerViewCollection.isHidden = true
                    }
                }
            default:
                break
            }
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
        
    }
}
