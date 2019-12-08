//
//  DetailRestaurant.swift
//  StourY
//
//  Created by 김기현 on 19/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation


extension DetailVC{
    func initRestaurant(){
        //menu
        let menuIcon = UIImageView()
        menuIcon.image = #imageLiteral(resourceName: "icon_menu")
        self.contentView.addSubview(menuIcon)
        menuIcon.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.height.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.07)//25/360
            make.top.equalTo(self.detailText.snp.bottom).offset(self.screenFrameWidth * 0.13)//48/360
        }
        
        //menu title
        let menuTitle = UILabel()
        switch User.sharedUser.language {
        case 0:
            menuTitle.text = "Menu"
        case 1:
            menuTitle.text = "메뉴"
        default:
            break
        }
        menuTitle.textColor = identityColor()
        menuTitle.numberOfLines = 0
        self.contentView.addSubview(menuTitle)
        menuTitle.font = UIFont(name: menuTitle.font.fontName, size: 16)
        menuTitle.sizeToFit()
        menuTitle.snp.makeConstraints { (make) in
            make.height.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(menuIcon.snp.right).offset(self.screenFrameWidth * 0.01)//3/360
            make.top.equalTo(menuIcon)
        }
        
        //menu detail
        self.menuDetail.text = (self.detailDict["menu"] as! String).html2String
        self.contentView.addSubview(self.menuDetail)
        self.menuDetail.numberOfLines = 2
        self.menuDetail.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.82)//(123+10.5+121.5+41)/360
//            make.height.equalTo(self.screenFrameWidth * 0.41)//(38+7+38+7+58)/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.08)//30/360
            make.top.equalTo(menuTitle.snp.bottom).offset(self.screenFrameWidth * 0.04)//16/360
        }
        self.menuDetail.sizeToFit()
        
        //more menu button
        let moreMenuButton = UIButton()
        moreMenuButton.setTitleColor(UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1), for: .normal)//139/255
        switch User.sharedUser.language{
        case 0:
            moreMenuButton.setTitle("More", for: .normal)
        case 1:
            moreMenuButton.setTitle("더보기", for: .normal)
        default:
            break
        }
        self.contentView.addSubview(moreMenuButton)
        moreMenuButton.titleEdgeInsets.right = 0
        moreMenuButton.snp.makeConstraints { (make) in
            make.top.equalTo(menuDetail.snp.bottom).offset(self.screenFrameWidth * 0.04)//13/360
            make.right.equalTo(self.buttonMoreDetail)//.offset(self.screenFrameWidth * -0.1)//35/360
        }
        moreMenuButton.tag = 0
        moreMenuButton.addTarget(self, action: #selector(self.tappedMoreMenu), for: .touchUpInside)
        
        //operationTime icon
        let operationTimeIcon = UIImageView()
        operationTimeIcon.image = #imageLiteral(resourceName: "icon_clock")
        self.contentView.addSubview(operationTimeIcon)
        operationTimeIcon.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.07)//25/360
            make.top.equalTo(self.menuDetail.snp.bottom).offset(self.screenFrameWidth * 0.14)//50/360
        }
        
        //operationTime title
        let operationTimeTitle = UILabel()
        switch User.sharedUser.language {
        case 0:
            operationTimeTitle.text = "operationx time"
        case 1:
            operationTimeTitle.text = "영업시간"
        default:
            break
        }
        operationTimeTitle.textColor = identityColor()
        operationTimeTitle.numberOfLines = 0
        self.contentView.addSubview(operationTimeTitle)
        operationTimeTitle.font = UIFont(name: operationTimeTitle.font.fontName, size: 16)
        operationTimeTitle.sizeToFit()
        operationTimeTitle.snp.makeConstraints { (make) in
            make.height.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(operationTimeIcon.snp.right).offset(self.screenFrameWidth * 0.01)//5/360
            make.top.equalTo(operationTimeIcon)
        }
        
        //operationTime detail
        self.labelOperationTimeDetail.text = (self.detailDict["operationTime"] as! String).html2String
        self.contentView.addSubview(self.labelOperationTimeDetail)
        self.labelOperationTimeDetail.font = UIFont(name: self.labelOperationTimeDetail.font.fontName, size: self.cgFloatDetailFontSize)
        self.labelOperationTimeDetail.numberOfLines = 2
        self.labelOperationTimeDetail.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.82)//(123+10.5+121.5+41)/360
//            make.height.equalTo(self.screenFrameWidth * 0.41)//(38+7+38+7+58)/360
            make.left.equalTo(operationTimeTitle)//.offset(self.screenFrameWidth * 0.09)//31/360
            make.top.equalTo(operationTimeTitle.snp.bottom).offset(self.screenFrameWidth * 0.04)//16/360
        }
        self.labelOperationTimeDetail.sizeToFit()
        
        //more operation button
        let moreOperationTimeButton = UIButton()
        moreOperationTimeButton.setTitleColor(UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1), for: .normal)//139/255
        switch User.sharedUser.language{
        case 0:
            moreOperationTimeButton.setTitle("More", for: .normal)
        case 1:
            moreOperationTimeButton.setTitle("더보기", for: .normal)
        default:
            break
        }
        self.contentView.addSubview(moreOperationTimeButton)
        moreOperationTimeButton.titleEdgeInsets.right = 0
        moreOperationTimeButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.labelOperationTimeDetail.snp.bottom).offset(self.screenFrameWidth * 0.04)//13/360
            make.right.equalTo(self.buttonMoreDetail)//.offset(self.screenFrameWidth * -0.1)//35/360
        }
        moreOperationTimeButton.tag = 0
        moreOperationTimeButton.addTarget(self, action: #selector(self.tappedMoreOperationTime(btn:)), for: .touchUpInside)
        
        //map icon
        let mapIcon = UIImageView()
        mapIcon.image = #imageLiteral(resourceName: "icon_map")
        self.contentView.addSubview(mapIcon)
        mapIcon.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.03)//12/360
            make.height.equalTo(self.screenFrameWidth * 0.04)//16.3/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.07)//25/360
            make.top.equalTo(moreOperationTimeButton.snp.bottom).offset(self.screenFrameWidth * 0.14)//50/360
        }
        
        //map title
        let mapTitle = UILabel()
        switch User.sharedUser.language {
        case 0:
            mapTitle.text = "Map"
        case 1:
            mapTitle.text = "지도"
        default:
            break
        }
        mapTitle.textColor = identityColor()
        mapTitle.numberOfLines = 0
        self.contentView.addSubview(mapTitle)
        mapTitle.font = UIFont(name: mapTitle.font.fontName, size: 16)
        mapTitle.sizeToFit()
        mapTitle.snp.makeConstraints { (make) in
            make.height.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(mapIcon.snp.right).offset(self.screenFrameWidth * 0.01)//5/360
            //            make.top.equalTo(mapIcon)
            make.centerY.equalTo(mapIcon)
            //            make.bottom.equalTo(self.contentView)
        }
        
        //mapView
        self.mapView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.86)//310/360
            make.height.equalTo(self.screenFrameWidth * 0.49)//176.2/360
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(mapTitle.snp.bottom).offset(self.screenFrameWidth * 0.05)//17/360
            make.bottom.equalTo(self.contentView).offset(self.screenFrameWidth * -0.17)//61.8/360
        }
        
        //google map button
        let buttonDirection = UIButton(type: .custom)
        buttonDirection.setImage(UIImage(named: "googlemap_direction_icon"), for: .normal)
        self.mapView.addSubview(buttonDirection)
        buttonDirection.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.1)//36/360
            make.top.equalTo(self.mapView).offset(self.screenFrameWidth * 0.03)//10/360
            make.right.equalTo(self.mapView.snp.right).offset(self.screenFrameWidth * -0.03)//10/360
        }
        buttonDirection.addTarget(self, action: #selector(self.tappedDirection(btn:)), for: .touchUpInside)
        
    }
    
    
}
