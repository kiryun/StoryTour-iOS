//
//  ToonGuideSetupView.swift
//  StourY
//
//  Created by 김기현 on 04/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension ToonGuideVC{
    func setupNavBar(){
        //navBar
        self.navBar = UINavigationBar()
        self.navBar.tintColor = .white // tintColor가 naviBar 줄임
        self.navBar.setBackgroundImage(UIImage(), for: .default)
        self.navBar.shadowImage = UIImage() // 이거 있어야 중간에 선없음
        self.navBar.backgroundColor = .white
        viewSetShadow(view: self.navBar)
        self.view.addSubview(self.navBar)
        
        self.navBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.18) //64 / 360
        }
//        self.navBar.isHidden = true
//        self.navBar.backgroundColor = .clear
        
        //navBarView
        let navBarView = UIView()
        navBarView.backgroundColor = .white
        self.navBar.addSubview(navBarView)
        navBarView.snp.makeConstraints { (make) in
            make.width.equalTo(self.navBar)
            make.height.equalTo(self.navBar)
            make.top.equalTo(self.navBar)
        }
        
        //title in navBar
        let title = UILabel()
        navBarView.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.navBar).offset(self.screenFrameWidth * 0.09)// 32/360
        }
        title.font = UIFont(name: title.font.fontName, size: 19)
        switch User.sharedUser.language{
        case 0:
            title.text = "Guide"
        case 1:
            title.text = "가이드"
        default:
            break
        }
        title.sizeToFit()

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
        
//        let buttonBack = UIButton()
//        buttonBack.setImage(UIImage(named: "btn_back_black"), for: .normal)
//        navBarView.addSubview(buttonBack)
//        buttonBack.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.03)//10/360
//            make.height.equalTo(self.screenFrameWidth * 0.05)//18/360
//            make.top.equalTo(navBarView).offset(self.screenFrameWidth * 0.09)//30/360
//            make.left.equalTo(navBarView).offset(self.screenFrameWidth * 0.04)//15/360
//        }
//        buttonBack.addTarget(self, action: #selector(self.tappedBackButton(btn:)), for: .touchUpInside)
    }
    func setupView(){
        self.viewPager.snp.makeConstraints { (make) in
            make.top.equalTo(self.navBar.snp.bottom)
        }
        
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.tappedViewPager(gesture:)))
//        self.viewPager.addGestureRecognizer(gesture)
    }
}

