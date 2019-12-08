//
//  MyPageSetupView.swift
//  StourY
//
//  Created by 김기현 on 23/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension MyPageVC{
    func setupView(){
        //headerView
        self.headerView.frame.size = CGSize(width: self.screenFrameWidth, height: self.screenFrameWidth * 1.57)//(32+20+3+40+30+1+30+21+20+300+45+16+5+2)/360
        
        
        //btn_setting
        self.btnSetting.setImage(#imageLiteral(resourceName: "btn_setting"), for: .normal)
        self.headerView.addSubview(self.btnSetting)
        self.btnSetting.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.06)//20/360
            make.top.equalTo(self.headerView).offset(self.screenFrameWidth * 0.09)//32/360
            make.right.equalTo(self.headerView).offset(self.screenFrameWidth * -0.04)//14.1/360
        }
        self.btnSetting.addTarget(self, action: #selector(self.loadSettingVC), for: .touchUpInside)
        
        //profilePicture
        self.profilePicture.image = #imageLiteral(resourceName: "profileDefault")
        self.headerView.addSubview(self.profilePicture)
        self.profilePicture.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.11)//40/360
            make.top.equalTo(self.headerView).offset(self.screenFrameWidth * 0.15)//55/360
            make.left.equalTo(self.headerView).offset(self.screenFrameWidth * 0.09)//31/360
        }
        //self.profilePicture.addGestureRecognizer(<#T##gestureRecognizer: UIGestureRecognizer##UIGestureRecognizer#>)
        
        //user name
        self.userName.text = User.sharedUser.fullName
        self.userName.numberOfLines = 1
        self.userName.font = UIFont(name: self.userName.font.fontName, size: 19)
        self.headerView.addSubview(self.userName)
        self.userName.snp.makeConstraints { (make) in
            make.left.equalTo(self.profilePicture.snp.right).offset(self.screenFrameWidth * 0.03)//9/360
            make.top.equalTo(self.headerView).offset(self.screenFrameWidth * 0.16)//58/360
        }
        
        //modify user info
        self.modifyUser.setImage(#imageLiteral(resourceName: "btn_profile_edit"), for: .normal)
        self.headerView.addSubview(self.modifyUser)
        self.modifyUser.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.04)//12.8/360
            make.top.equalTo(self.headerView).offset(self.screenFrameWidth * 0.17)//59.6/360
            make.left.equalTo(self.userName.snp.right).offset(self.screenFrameWidth * 0.01)//3.6/360
        }
        self.modifyUser.isHidden = true
//        self.modifyUser.addTarget(self, action: #selector(), for: .touchUpInside)
        
        //user eamil
        self.userEmail.text = User.sharedUser.email
        self.userEmail.numberOfLines = 1
        self.userEmail.font = UIFont(name: self.userEmail.font.fontName, size: 15)
        self.headerView.addSubview(self.userEmail)
        self.userEmail.snp.makeConstraints { (make) in
            make.left.equalTo(self.profilePicture.snp.right).offset(self.screenFrameWidth * 0.03)//10/360
            make.bottom.equalTo(self.profilePicture)
        }
        
        //topLine
        let topLine = UIView()
        topLine.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
        self.headerView.addSubview(topLine)
        topLine.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.91)//327/360
            make.height.equalTo(1)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.profilePicture.snp.bottom).offset(self.screenFrameWidth * 0.08)//30/360
        }
        
        //footPrints title
        let footPrintsTitle = UILabel()
        switch User.sharedUser.language {
        case 0:
            footPrintsTitle.text = "My foot prints"
        case 1:
            footPrintsTitle.text = "나의 발자취"
        default:
            break
        }
        footPrintsTitle.textColor = identityColor()
        self.headerView.addSubview(footPrintsTitle)
        footPrintsTitle.numberOfLines = 1
        footPrintsTitle.font = UIFont(name: footPrintsTitle.font.fontName, size: 21)
        footPrintsTitle.snp.makeConstraints { (make) in
            make.left.equalTo(self.profilePicture)
            make.top.equalTo(topLine).offset(self.screenFrameWidth * 0.08)//30/360
        }
        
        
        //mapView shadow
        let mapShadowView = UIView()
        viewSetShadow(view: mapShadowView)
        self.headerView.addSubview(mapShadowView)
        mapShadowView.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.83)//300/360
            make.top.equalTo(topLine.snp.bottom).offset(self.screenFrameWidth * 0.2)//71/360
            make.centerX.equalTo(self.view)
//            make.left.equalTo(self.view).offset(self.screenFrameWidth * 0.08)//30/360
//            make.right.equalTo(self.view).offset(self.screenFrameWidth * -0.08)//30/360
        }
        
        //mapView
        viewSetRadius(view: self.mapView, radius: 10.0, color: false)
        mapShadowView.addSubview(self.mapView)
        self.mapView.snp.makeConstraints { (make) in
            make.width.height.equalTo(mapShadowView)//300/360
            make.center.equalTo(mapShadowView)
        }
        
        //segmentView
        self.segmentctrl = NavigationSegmentController()
        switch User.sharedUser.language {
        case 0:
            segmentctrl.commaSeperatedButtonTitles = "Liked, Visited"
        case 1:
            segmentctrl.commaSeperatedButtonTitles = "좋아요, 가봤어요"
        default:
            break
        }
//        let color = UIColor(hue: 1, saturation: 0, brightness: 0, alpha: 1)
//        self.segmentctrl.backgroundColor = color
//        self.segmentctrl.borderColor = color
//        self.segmentctrl.textColor = color
//        self.segmentctrl.selectorColor = color
//        self.segmentctrl.selectorTextColor = color
        self.segmentctrl.backgroundColor = .white
        self.segmentctrl.borderColor = .black
        self.segmentctrl.textColor = .black
        self.segmentctrl.selectorColor = identityColor()
        self.segmentctrl.selectorTextColor = identityColor()
        
        self.headerView.addSubview(self.segmentctrl)
        self.segmentctrl.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.59)//(66+80+66)/360
            make.height.equalTo(self.screenFrameWidth * 0.06)//(16+5+2)/360
            make.top.equalTo(mapShadowView.snp.bottom).offset(self.screenFrameWidth * 0.13)//45/360
            make.centerX.equalTo(self.view)
        }
        self.segmentctrl.addTarget(self, action: #selector(self.onChangeOfSegment), for: .valueChanged)
        
        let sizeTableLoading = CGSize(width: 30, height: 30)
        self.loadingTableView.frame.size = sizeTableLoading
        //        let loading = NVActivityIndicatorView(frame: frameLoading, type: .ballGridBeat, color: identityColor())
        self.view.addSubview(self.loadingTableView)
        self.loadingTableView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.tableView)
            make.top.equalTo(self.headerView.snp.bottom).offset(15)
            
        }
        self.loadingTableView.startAnimating()
    }
    
    
}
