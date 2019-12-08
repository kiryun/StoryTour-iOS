//
//  AudioGuideVC.swift
//  StourY
//
//  Created by 김기현 on 23/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import GoogleMaps

//1. segment 안바뀜
//2. 재생 중 다른 마커 탭하면 정지가 안됨
//3. 처음 로드 될 때 map위치
//4. 내렸는데도 안사라짐 걍 backbutton달까?
//5. 처음 뷰가 로드 되었을 때 navTitle이 "음성가이드"로 되어있음
//6. 처음 뷰가 로드 되었을 때 segment의 selectView는 제대로 표출 되고 있으나, selectText는 항상 음성으로 되어 있음

class ToonAudioGuideVC: UIViewController {
    let screenFrameWidth = UIScreen.main.bounds.width
    
    var navBar: UINavigationBar!
    let navTitle = UILabel()
    
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var markerList = Array<GMSMarker>()
    var currentMarker = 0
    
    var segmentCtrl = CustomSegmentControl()
    
    //0 : 음성
    //1 : 카툰
    
    //받아온 데이터
    var intFirstSegementVal = 0
    var attrIdx: Int = 0
    var lat: Double = 0.0
    var lon: Double = 0.0

    
    var audioGuideList = Array<AudioGuideForm>()
    var toonGuideList = Array<ToonGuideForm>()
    //playBar initialize
    var playBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNaviBar()
        self.setupView()
        
        //get data
        self.getGuides()
        
        //map setup
        self.locationManager.delegate = self
        self.mapView.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.mapView.isMyLocationEnabled = true
        
    }
    
}
