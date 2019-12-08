//
//  MapSetupView.swift
//  StourY
//
//  Created by 김기현 on 09/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension MapVC{
    func setupNaviBar(){
        //navBar
        self.navBar = UINavigationBar()//(frame: CGRect(x: 0, y: 0, width: self.screenFrameWidth, height: self.screenFrameWidth * 0.21)) // height: 75 / 360
        self.navBar.tintColor = .white // tintColor가 naviBar 줄임
        self.navBar.setBackgroundImage(UIImage(), for: .default)
        self.navBar.shadowImage = UIImage() // 이거 있어야 중간에 선없음
        self.navBar.backgroundColor = .white
        viewSetShadow(view: self.navBar)
        self.view.addSubview(self.navBar)
        
        self.navBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.21)
        }
        
        //navBarView
        let navBarView = UIView()//(frame: CGRect(x: 0, y: 0, width: screenFrameWidth, height: screenFrameWidth * 0.21))
        navBarView.backgroundColor = .white
        self.navBar.addSubview(navBarView)
        navBarView.snp.makeConstraints { (make) in
            make.width.equalTo(self.navBar)
            make.height.equalTo(self.navBar)
            make.top.equalTo(self.navBar)
        }
        
        //segmentView
        self.controlSegment.frame = CGRect(x: self.screenFrameWidth * 0.31, y: self.screenFrameWidth * 0.08, width: self.screenFrameWidth * 0.39, height: self.screenFrameWidth * 0.09)//x: 110, y: 29.7, width: 140, height: 32 /360
        switch User.sharedUser.language {
        case 0:
            self.controlSegment.commaSeparatedButtonTitles = "Tour,Food"
        case 1:
            self.controlSegment.commaSeparatedButtonTitles = "관광지,맛집"
        default:
            self.controlSegment.commaSeparatedButtonTitles = "Tour,Food"
        }
        viewSetRadius(view: self.controlSegment, radius: self.controlSegment.frame.height * 0.5, color: false)
        self.controlSegment.backgroundColor = .white
        self.controlSegment.borderWidth = 1
        self.controlSegment.borderColor = identityColor()
        self.controlSegment.selectorColor = identityColor()
        self.controlSegment.textColor = .black
        self.controlSegment.selectorTextColor = .white
        self.navBar.addSubview(self.controlSegment)
        self.controlSegment.addTarget(self, action: #selector(self.changedSegment(value:)), for: .valueChanged)
    }
    
    func setupView(){
        self.mapView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navBar.snp.bottom)
        }
        
        //current location
        let buttonLocation = UIButton(type: .custom)
        buttonLocation.setImage(UIImage(named: "btn_gps"), for: .normal)
        self.mapView.addSubview(buttonLocation)
        buttonLocation.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.24)//45/360(=0.12)
            make.top.equalTo(self.navBar.snp.bottom).offset(self.screenFrameWidth * 0.04)//5/360
            make.right.equalTo(self.mapView).offset(self.screenFrameWidth * -0.01)//16/360
        }
        buttonLocation.addTarget(self, action: #selector(self.tappedLocationButton(btn:)), for: .touchUpInside)
        
        //refresh button
        let buttonRefresh = UIButton(type: .custom)
        buttonRefresh.setImage(UIImage(named: "btn_refresh"), for: .normal)
        self.mapView.addSubview(buttonRefresh)
        buttonRefresh.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.24)//45/360(=0.12)
            make.top.equalTo(buttonLocation.snp.bottom).offset(self.screenFrameWidth * -0.03)//12/360
            make.right.equalTo(buttonLocation)
        }
        buttonRefresh.addTarget(self, action: #selector(self.tappedRefreshButton(btn:)), for: .touchUpInside)
        
//        self.containerViewCollection.backgroundColor = .clear
        self.mapView.addSubview(self.containerViewCollection)
        self.containerViewCollection.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.28)//100/360
            make.bottom.equalTo(self.mapView).offset(self.screenFrameWidth * -0.03)//10/360
            make.centerX.equalTo(self.mapView)
        }
//        self.containerViewCollection.layer.zPosition  = -100
        self.imageViewLocation.image = UIImage(named: "icon_marker")
        self.mapView.addSubview(self.imageViewLocation)
        self.imageViewLocation.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.09)
            make.height.equalTo(self.screenFrameWidth * 0.12)
            make.center.equalTo(self.mapView)
        }
    }
}
