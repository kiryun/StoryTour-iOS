//
//  setupView.swift
//  StourY
//
//  Created by 김기현 on 27/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension ToonAudioGuideVC{
    
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
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.17) //62 / 360
        }
        
        //navBarView
        let navBarView = UIView()//(frame: CGRect(x: 0, y: 0, width: screenFrameWidth, height: screenFrameWidth * 0.21))
        navBarView.backgroundColor = .white
        self.navBar.addSubview(navBarView)
        navBarView.snp.makeConstraints { (make) in
            make.width.equalTo(self.navBar)
            make.height.equalTo(self.navBar)
            make.top.equalTo(self.navBar)
            make.centerX.equalTo(self.navBar)
        }
        
        //title in navBar
        navBarView.addSubview(self.navTitle)
        self.navTitle.textAlignment = .center
        self.navTitle.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.navBar).offset(self.screenFrameWidth * 0.09)// 32/360
        }
        self.navTitle.font = UIFont(name: self.navTitle.font.fontName, size: 19)
        if self.intFirstSegementVal == 0{
            switch User.sharedUser.language{
            case 0:
                self.navTitle.text = "Audio guide"
            case 1:
                self.navTitle.text = "음성 가이드"
            default:
                self.navTitle.text = "Audio guide"
            }
        }else{
            switch User.sharedUser.language{
            case 0:
                self.navTitle.text = "Cartoon guide"
            case 1:
                self.navTitle.text = "카툰 가이드"
            default:
                self.navTitle.text = "Cartoon guide"
            }
        }
        
        self.navTitle.sizeToFit()
        
        //down button
        let buttonDown = UIButton(type: .custom)
        buttonDown.setImage(UIImage(named: "btn_down_black"), for: .normal)
        self.navBar.addSubview(buttonDown)
        buttonDown.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.05)//18/360
            make.height.equalTo(self.screenFrameWidth * 0.03)//10/360
            make.top.equalTo(self.navBar).offset(self.screenFrameWidth * 0.09)//30/360
            make.left.equalTo(self.navBar).offset(self.screenFrameWidth * 0.04)//15/360
        }
        buttonDown.addTarget(self, action: #selector(self.tappedDownButton(btn:)), for: .touchUpInside)
        
    }
    
    func setupView(){
        
        //map
        self.mapView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navBar.snp.bottom)
        }
        
        //segment ctrl
         self.segmentCtrl.frame = CGRect(x: self.screenFrameWidth * 0.04, y: self.screenFrameWidth * 0.04, width: self.screenFrameWidth * 0.29, height: self.screenFrameWidth * 0.09)
        switch User.sharedUser.language {
        case 0:
            self.segmentCtrl.commaSeparatedButtonTitles = "Audio,Toon"
        case 1:
            self.segmentCtrl.commaSeparatedButtonTitles = "음성,카툰"
        default:
            self.segmentCtrl.commaSeparatedButtonTitles = "Audio,Toon"
        }
        viewSetRadius(view: self.segmentCtrl, radius: self.segmentCtrl.frame.height * 0.5, color: false)
        self.segmentCtrl.backgroundColor = .white
        self.segmentCtrl.borderWidth = 1
        self.segmentCtrl.borderColor = identityColor()
        self.segmentCtrl.selectorColor = identityColor()
        self.segmentCtrl.textColor = .black
        self.segmentCtrl.selectorTextColor = .white
//        print(self.segmentCtrl.selectedSegmentIndex)
        switch self.intFirstSegementVal {
        case 0:
//            self.segmentCtrl.changeSelectedButton(nowSelect: 0)
            self.segmentCtrl.selectedSegmentIndex = 0
//            self.currentSegment = 0
        case 1:
            self.segmentCtrl.changeSelectedButton(nowSelect: 1)
            self.segmentCtrl.selectedSegmentIndex = 1
//            self.currentSegment = 1
        default:
            break
        }
        self.mapView.addSubview(self.segmentCtrl)
        self.segmentCtrl.addTarget(self, action: #selector(self.changeSegmentValue), for: .valueChanged)
       
    }
}
