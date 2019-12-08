//
//  MyPageSettingSetupView.swift
//  StourY
//
//  Created by 김기현 on 26/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension MyPageSettingVC{
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
            make.height.equalTo(self.screenFrameWidth * 0.18) //62 / 360(=0.17)
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
        
        
        //backBtn in navBar
        let buttonBack = UIButton(type: .custom)
        buttonBack.setImage(UIImage(named: "btn_back_black"), for: .normal)
        navBarView.addSubview(buttonBack)
        buttonBack.frame.origin.x = self.screenFrameWidth * 0.06 //20/360
        buttonBack.frame.origin.y = self.screenFrameWidth * 0.1 //40/360
        buttonBack.frame.size.width = self.screenFrameWidth * 0.04 //15/360
        buttonBack.frame.size.height = self.screenFrameWidth * 0.07 //25/360
        buttonBack.addTarget(self, action: #selector(self.tappedBack(btn:)), for: .touchUpInside)
        
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
            title.text = "Setting"
        case 1:
            title.text = "환경설정"
        default:
            break
        }
        title.sizeToFit()
    }
    func setupView(){
        //tableView
        self.tableView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 3)
            make.top.equalTo(self.navBar.snp.bottom)
            make.left.right.bottom.equalTo(self.view)
        }
        
        
        //footerView
        self.footerView.backgroundColor = .white
        self.footerView.frame.size = CGSize(width: self.screenFrameWidth, height: self.screenFrameWidth * 1.24)//445/360
//        self.footerView.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth)
//            make.height.equalTo(self.view)
//        }
        
        //log out view
        self.logOutView.backgroundColor = .white
        viewSetRadius(view: self.logOutView, radius: 10.0, color: true)
        self.footerView.addSubview(self.logOutView)
        self.logOutView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.52)//188/360
            make.height.equalTo(self.screenFrameWidth * 0.1)//35/360
            make.top.equalTo(self.footerView).offset(self.screenFrameWidth * 0.16)//56/360
            make.centerX.equalTo(self.view)
        }
        
        //log out label
        let logOutLabel = UILabel()
        self.logOutView.addSubview(logOutLabel)
        switch User.sharedUser.language {
        case 0:
            logOutLabel.text = "log out"
        case 1:
            logOutLabel.text = "로그 아웃"
        default:
            break
        }
        logOutLabel.textAlignment = .center
        logOutLabel.font = UIFont(name: logOutLabel.font.fontName, size: 16)
        logOutLabel.numberOfLines = 0
        logOutLabel.sizeToFit()
        logOutLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self.logOutView)
            make.height.equalTo(self.logOutView)
            make.center.equalTo(self.logOutView)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedLogOut(gestrue:)))
        self.logOutView.addGestureRecognizer(tapGesture)
        
        
        //popup view filter
        self.viewPopUpFilter.backgroundColor = .black
        self.viewPopUpFilter.alpha = 0.3
        self.view.addSubview(self.viewPopUpFilter)
        self.viewPopUpFilter.bounds.size = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        self.viewPopUpFilter.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        
        //popup view
        
        viewPopUp.backgroundColor = .white
        viewSetRadius(view: viewPopUp, radius: 10.0, color: false)
        self.view.addSubview(viewPopUp)
        viewPopUp.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.86)//310,160
            make.height.equalTo(self.screenFrameWidth * 0.44)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(self.screenFrameWidth * 0.53)//189
        }
        
        //title
        self.labelTitle.font = UIFont.boldSystemFont(ofSize: 19.0) // bold
        self.labelTitle.textColor = .black
        viewPopUp.addSubview(self.labelTitle)
        self.labelTitle.numberOfLines = 0
        self.labelTitle.sizeToFit()
        self.labelTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(viewPopUp)
            make.top.equalTo(viewPopUp).offset(self.screenFrameWidth * 0.05)//17/360
        }
        
        //summary
        self.labelSummary.font = .systemFont(ofSize: 13)
        self.labelSummary.textColor = .black
        self.labelSummary.textAlignment = .center
        viewPopUp.addSubview(self.labelSummary)
        self.labelSummary.numberOfLines = 0
        self.labelSummary.sizeToFit()
        self.labelSummary.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.56)//202
            make.centerX.equalTo(self.labelTitle)
            make.top.equalTo(self.labelTitle).offset(self.screenFrameWidth * 0.08)//19/360
        }
        
        let viewLine = UIView()
        viewLine.backgroundColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        viewPopUp.addSubview(viewLine)
        viewLine.snp.makeConstraints { (make) in
            make.width.equalTo(viewPopUp)
            make.height.equalTo(1)
            make.centerX.equalTo(viewPopUp)
            make.top.equalTo(viewPopUp).offset(self.screenFrameWidth * (125/360))
        }
        
        //button left
        self.buttonLeft.backgroundColor = .white
        switch User.sharedUser.language {
        case 0:
            self.buttonLeft.setTitle("OK", for: .normal)
        case 1:
            self.buttonLeft.setTitle("확인", for: .normal)
        default:
            self.buttonLeft.setTitle("OK", for: .normal)
        }
        self.buttonLeft.setTitleColor(.black, for: .normal)
        self.buttonLeft.addTarget(self, action: #selector(self.tappedLeft(btn:)), for: .touchUpInside)
//        self.buttonLeft.snp.makeConstraints { (make) in
//            make.width.equalTo(viewPopUp).offset(0.5)
//            make.top.equalTo(viewLine.snp.bottom)
//            make.bottom.equalTo(viewPopUp)
//            make.left.equalTo(viewPopUp)
//            //            make.right.equalTo(viewPopUp).offset(0.5)
//        }
        
        self.buttonRight.backgroundColor = identityColor()
        switch User.sharedUser.language {
        case 0:
            self.buttonRight.setTitle("Cancel", for: .normal)
        case 1:
            self.buttonRight.setTitle("취소", for: .normal)
        default:
            self.buttonRight.setTitle("Cancel", for: .normal)
        }
        self.buttonRight.setTitleColor(.white, for: .normal)
        self.buttonRight.addTarget(self, action: #selector(self.tappedRight(btn:)), for: .touchUpInside)
        
        //stackview
        let stackViewButtons = UIStackView()
        stackViewButtons.addArrangedSubview(self.buttonLeft)
        stackViewButtons.addArrangedSubview(self.buttonRight)
        stackViewButtons.distribution = .fillEqually
        viewPopUp.addSubview(stackViewButtons)
        stackViewButtons.snp.makeConstraints { (make) in
            make.width.equalTo(viewPopUp)
            make.height.equalTo(self.screenFrameWidth * 35/360)//
            make.centerX.equalTo(viewPopUp)
            make.top.equalTo(viewLine.snp.bottom)
        }
        
        self.viewPopUpFilter.isHidden = true
        self.viewPopUp.isHidden = true
        
        
        
    }
}
