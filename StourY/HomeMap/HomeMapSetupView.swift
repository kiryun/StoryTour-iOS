//
//  HomeMapMap.swift
//  StourY
//
//  Created by 김기현 on 05/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension HomeMapVC{
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
            make.height.equalTo(self.screenFrameWidth * 0.17) // 62/360
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
        
    }
    
    func setupView(){
        self.mapView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navBar.snp.bottom)
        }
        
//        //back button
//        let backButton = UIButton(type: .custom)
//        backButton.setImage(UIImage(named: "btn_back_black"), for: .normal)
//        self.navBar.addSubview(backButton)
//        backButton.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.02)//7/360
//            make.height.equalTo(self.screenFrameWidth * 0.05)//18/360
//            make.top.equalTo(self.navBar).offset(self.screenFrameWidth * 0.08)//30/360
//            make.left.equalTo(self.navBar).offset(self.screenFrameWidth * 0.04)//15/360
//        }
//        backButton.addTarget(self, action: #selector(self.tappedBackButton(btn:)), for: .touchUpInside)
        
        //title
        let labelTitle = UILabel()
        switch User.sharedUser.language {
        case 0:
            labelTitle.text = "Setup My Location"
        case 1:
            labelTitle.text = "내 위치 설정하기"
        default:
            labelTitle.text = "Setup My Location"
        }
        self.navBar.addSubview(labelTitle)
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont(name: labelTitle.font.fontName, size: 22)//self.screenFrameWidth * 0.06)//22/360
        labelTitle.numberOfLines = 0
        labelTitle.sizeToFit()
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalTo(self.navBar)
            make.height.equalTo(self.screenFrameWidth * 0.06)//22/360
            make.centerX.equalTo(self.navBar)
            make.top.equalTo(self.navBar).offset(self.screenFrameWidth * 0.08)//29/360
        }
        
        //Completed setup shadow
        let buttonCompletedSetup = UIButton(type: .custom)
        buttonCompletedSetup.backgroundColor = identityColor()
        switch User.sharedUser.language {
        case 0:
            buttonCompletedSetup.setTitle("Completed setup", for: .normal)
        case 1:
            buttonCompletedSetup.setTitle("설정완료", for: .normal)
        default:
            buttonCompletedSetup.setTitle("Completed setup", for: .normal)
        }
        buttonCompletedSetup.setTitleColor(.white, for: .normal)
        buttonCompletedSetup.titleLabel?.textAlignment = .center
        self.mapView.addSubview(buttonCompletedSetup)
        buttonCompletedSetup.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.61)//220/360
            make.height.equalTo(self.screenFrameWidth * 0.11)//40/360
            make.centerX.equalTo(self.mapView)
            make.bottom.equalTo(self.mapView).offset(self.screenFrameWidth * -0.1)//36/360
        }
//        print(buttonCompletedSetup.frame) // frame 0 0 0 0 나옴
        viewSetRadius(view: buttonCompletedSetup, radius: self.screenFrameWidth * 0.11 * 0.5, color: false)
        buttonCompletedSetup.addTarget(self, action: #selector(self.tappedCompletedSetupButton(btn:)), for: .touchUpInside)
        
//        let imageViewMarker = UIImageView()
//        imageViewMarker.image = UIImage(named: "pin")
//        self.mapView.addSubview(imageViewMarker)
//        imageViewMarker.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.07)//25/360
//            make.height.equalTo(self.screenFrameWidth * 0.08)//30/360
//            make.center.equalTo(self.mapView)
//        }
    }
}
