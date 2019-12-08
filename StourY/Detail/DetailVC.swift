//
//  DetailVC.swift
//  StourY
//
//  Created by 김기현 on 17/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import GoogleMaps
//1. snapkit으로 뷰1의 center를 듀 뷰 사이의 중간으로 정하기
//2. operationTime, useTime에서 time 어떻게 뽑아냄? -> 일단은 view로 감싸서 하는중임
//3. statusBar 투명하게 바꿔
//4. textView -> UILabel로 바꿀 것 그리고 크기 텍스트에 딱맞게 변경해야함
//5. auditoButton과 ToonButton이 서로 겹쳐서 waring 뜸 기능상 큰문제는 아님

class DetailVC: UIViewController {
    var screenFrameWidth = UIScreen.main.bounds.width
    
//    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    
    var detailDict = Dictionary<String,Any>()
    
    //detail에서 쓰이는 font사이즈
    var cgFloatDetailFontSize: CGFloat = 18
    
    
    //받아온 데이터
    var attrIdx = 0
    var type = 0
    
    //visit button
//    let buttonVisit = UIButton()
    let viewVisit = UIView()
    let imageViewVisit = UIImageView()
    let labelVisit = UILabel()
    
    let viewLike = UIView()
    let imageViewLike = UIImageView()
    let labelLike = UILabel()
    
    let viewVisitScoreMaster = UIView()
    let imageViewVisitScore = UIImageView() // 말풍선 이미지
    
    let detailTitle = UILabel()
    let detailText = UILabel()
    let buttonMoreDetail = UIButton()
    
    //tour
    let labelUseTimeDetail = UILabel()
    let labelPriceDetail = UILabel()
    
    //restaurant
    let menuDetail = UILabel()
    let labelOperationTimeDetail = UILabel()
    
    let filterView = UIView()
    let guideToonButton = UIButton()
    let guideAudioButton = UIButton()
    let guideButton = UIButton()
    
    //map
    var lat = Double() //self.detailDict["lat"] as! Double
    var lon = Double() //self.detailDict["lon"] as! Double
    let marker = GMSMarker()
    
    //guideToonAudio parts
    var toonAudioGuide = UIView()
//    var animator:UIDynamicAnimator!
//    var gravity:UIGravityBehavior!
//    var snap:UISnapBehavior!
//    var previousTouchPoint:CGPoint!
//    var viewDragging = false
//    var viewPinned = false
//    var offset:CGFloat = 250
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set font size
//        self.cgFloatDetailFontSize = self.screenFrameWidth * 0.04//13/360
        
        //data server
        self.getDetail()
        
        //map
        self.locationManager.delegate = self
        self.mapView.delegate = self
        self.locationManager.requestWhenInUseAuthorization() // 권한 요청
        
//        //toon audio guide
//        self.animator = UIDynamicAnimator(referenceView: self.view)
//        self.gravity = UIGravityBehavior()
//
//        self.animator.addBehavior(self.gravity)
//        self.gravity.magnitude = 4
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.addGuideViewController()
//    }
    
    func getDetail(){
        if Reachability.isConnectedToNetwork(){
            switch self.type {
            case 100://tour
                ApiClient.sharedApiClient.getTourDetail(attractionIdx: self.attrIdx) { (res, err) in
                    if err == nil{
                        print("success get tour detail")
                        setResponseData(responseObject: res, tour: &self.detailDict)
                        self.lat = self.detailDict["lat"] as! Double
                        self.lon = self.detailDict["lon"] as! Double
                        
                        //                    self.locationManager.requestLocation()
                        self.locationManager.startUpdatingLocation()
                        
                        
                        self.createMarker()
                        self.setupView()
                    }else{
                        print("get tour detail fail!")
                    }
                }
            case 200://restaurant
                ApiClient.sharedApiClient.getRestaurantDetail(attractionIdx: self.attrIdx) { (res, err) in
                    if err == nil{
                        print("success get restaurant detail")
                        setResponseData(responseObject: res, restaurant: &self.detailDict)
                        self.lat = self.detailDict["lat"] as! Double
                        self.lon = self.detailDict["lon"] as! Double
                        
                        //                    self.locationManager.requestLocation()
                        self.locationManager.startUpdatingLocation()
                        
                        self.createMarker()
                        self.setupView()
                    }else{
                        print("get restaurant detail fail!")
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


