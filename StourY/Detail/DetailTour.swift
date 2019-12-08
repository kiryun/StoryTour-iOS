//
//  DetailTour.swift
//  StourY
//
//  Created by 김기현 on 19/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//



import Foundation

extension DetailVC{
    func initTour(){
//        let imageList = self.detailDict["imgList"] as! Array<String>
//
//        //videoView1
//        let videoView1 = UIView()
//        viewSetRadius(view: videoView1, radius: 10.0, color: true)
//        self.contentView.addSubview(videoView1)
//        videoView1.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.81)//290/360
//            make.height.equalTo(self.screenFrameWidth * 0.14)//50/360
//            make.centerX.equalTo(self.contentView)
//            make.top.equalTo(self.detailText.snp.bottom).offset(self.screenFrameWidth * 0.06)//21/360
////            make.bottom.equalTo(self.contentView)//scrollView scrolling test
//        }
//        let videoViewGesture = UITapGestureRecognizer(target: self, action:  #selector (self.onTriggerYoutube(sender:)))
//        videoView1.addGestureRecognizer(videoViewGesture)
//        
//        //video thumnail1
//        let videoThumnail1 = UIImageView()
//        videoThumnail1.contentMode = .scaleToFill
//        videoThumnail1.image = getThumanilImage(thumnailAddr: imageList[0])
//        videoView1.addSubview(videoThumnail1)
//        videoThumnail1.snp.makeConstraints { (make) in
//            make.width.height.equalTo(self.screenFrameWidth * 0.14)//50/360
//            make.left.top.equalTo(videoView1)
//        }
//        
//        let videoTitle1 = UILabel()
//        let name = self.detailDict["name"] as! String
//        switch User.sharedUser.language{
//        case 0:
//            videoTitle1.text = name+" introduction video"
//        case 1:
//            videoTitle1.text = name+" 소개영상"
//        default:
//            break
//        }
//        videoTitle1.numberOfLines = 0
//        videoView1.addSubview(videoTitle1)
//        videoTitle1.font = UIFont(name: videoTitle1.font.fontName, size: 17)
//        videoTitle1.sizeToFit()
//        videoTitle1.snp.makeConstraints { (make) in
//            make.left.equalTo(videoThumnail1.snp.right).offset(self.screenFrameWidth * 0.04)//13/360
//            make.top.equalTo(videoView1).offset(self.screenFrameWidth * 0.02)//8/360
//        }
//        
//        let videoDate1 = UILabel()
//        videoDate1.text = "2018.02.12"
//        videoDate1.numberOfLines = 0
//        videoView1.addSubview(videoDate1)
//        videoDate1.sizeToFit()
//        videoDate1.snp.makeConstraints { (make) in
//            make.left.equalTo(videoThumnail1.snp.right).offset(self.screenFrameWidth * 0.05)//13/360
//            make.top.equalTo(videoTitle1.snp.bottom)
//        }
//        
//        //videoView2
//        let videoView2 = UIView()
//        viewSetRadius(view: videoView2, radius: 10.0, color: true)
//        self.contentView.addSubview(videoView2)
//        videoView2.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.81)//290/360
//            make.height.equalTo(self.screenFrameWidth * 0.14)//50/360
//            make.centerX.equalTo(self.contentView)
//            make.top.equalTo(videoView1.snp.bottom).offset(self.screenFrameWidth * 0.01)//4/360
////            make.bottom.equalTo(self.contentView)//scrollView scrolling test
//        }
////        let videoViewGesture = UITapGestureRecognizer(target: self, action:  #selector (self.onTriggerYoutube(sender:)))
////        videoView1.addGestureRecognizer(videoViewGesture)
//        
//        //video thumnail1
//        let videoThumnail2 = UIImageView()
//        videoThumnail2.contentMode = .scaleToFill
//        videoThumnail2.image = getThumanilImage(thumnailAddr: imageList[1])
//        videoView2.addSubview(videoThumnail2)
//        videoThumnail2.snp.makeConstraints { (make) in
//            make.width.height.equalTo(self.screenFrameWidth * 0.14)//50/360
//            make.left.top.equalTo(videoView2)
//        }
//        
//        let videoTitle2 = UILabel()
//        switch User.sharedUser.language{
//        case 0:
//            videoTitle2.text = name+" introduction video"
//        case 1:
//            videoTitle2.text = name+" 소개영상"
//        default:
//            break
//        }
//        videoTitle2.numberOfLines = 0
//        videoView2.addSubview(videoTitle2)
//        videoTitle2.font = UIFont(name: videoTitle2.font.fontName, size: 17)
//        videoTitle2.sizeToFit()
//        videoTitle2.snp.makeConstraints { (make) in
//            make.left.equalTo(videoThumnail2.snp.right).offset(self.screenFrameWidth * 0.04)//13/360
//            make.top.equalTo(videoView2).offset(self.screenFrameWidth * 0.02)//8/360
//        }
//        
//        let videoDate2 = UILabel()
//        videoDate2.text = "2018.02.12"
//        videoDate2.numberOfLines = 0
//        videoView2.addSubview(videoDate2)
//        videoDate2.sizeToFit()
//        videoDate2.snp.makeConstraints { (make) in
//            make.left.equalTo(videoThumnail2.snp.right).offset(self.screenFrameWidth * 0.05)//13/360
//            make.top.equalTo(videoTitle2.snp.bottom)
//        }
//        
//        //more video
//        let moreVideoButton = UIButton()
//        moreVideoButton.setTitleColor(UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1), for: .normal)//139/255
//        switch User.sharedUser.language{
//        case 0:
//            moreVideoButton.setTitle("More video >", for: .normal)
//        case 1:
//            moreVideoButton.setTitle("관련 영상 더보기 >", for: .normal)
//        default:
//            break
//        }
//        self.contentView.addSubview(moreVideoButton)
//        moreVideoButton.titleEdgeInsets.right = 0
//        moreVideoButton.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.26)//93/360
//            make.height.equalTo(self.screenFrameWidth * 0.05)//18/360
//            make.top.equalTo(videoView2.snp.bottom).offset(self.screenFrameWidth * 0.03)//12/360
//            make.right.equalTo(videoView2)//.offset(self.screenFrameWidth * -0.1)//35/360
////            make.bottom.equalTo(self.contentView)//scrollView scrolling test
//        }
//        moreVideoButton.addTarget(self, action: #selector(self.tappedMoreVideo), for: .touchUpInside)
        
        //price icon
        let priceIcon = UIImageView()
        priceIcon.image = #imageLiteral(resourceName: "won")
        self.contentView.addSubview(priceIcon)
        priceIcon.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.07)//25/360
            make.top.equalTo(self.buttonMoreDetail.snp.bottom).offset(self.screenFrameWidth * 0.06)//21/360
//            make.top.equalTo(moreVideoButton).offset(self.screenFrameWidth * 0.14)//50/360
        }
        
        //price title
        let priceTitle = UILabel()
        switch User.sharedUser.language {
        case 0:
            priceTitle.text = "price"
        case 1:
            priceTitle.text = "입장료"
        default:
            break
        }
        priceTitle.textColor = identityColor()
        priceTitle.numberOfLines = 0
        self.contentView.addSubview(priceTitle)
        priceTitle.font = UIFont(name: priceTitle.font.fontName, size: 16)
        priceTitle.sizeToFit()
        priceTitle.snp.makeConstraints { (make) in
            make.height.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(priceIcon.snp.right).offset(self.screenFrameWidth * 0.01)//5/360
            make.top.equalTo(priceIcon)
        }
        
        //price detail
        self.labelPriceDetail.text = (self.detailDict["detail"] as! String).html2String
        self.contentView.addSubview(self.labelPriceDetail)
        self.labelPriceDetail.numberOfLines = 4
        self.labelPriceDetail.font = UIFont(name: self.labelPriceDetail.font.fontName, size: self.cgFloatDetailFontSize)
        self.labelPriceDetail.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.82)//(123+10.5+121.5+41)/360
//            make.height.equalTo(self.screenFrameWidth * 0.41)//(38+7+38+7+58)/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.09)//31/360
            make.top.equalTo(priceTitle.snp.bottom).offset(self.screenFrameWidth * 0.04)//16/360
        }
        self.labelPriceDetail.sizeToFit()
        
        // more price button
        let buttonMorePrice = UIButton(type: .custom)
        buttonMorePrice.setTitleColor(UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1), for: .normal)//139/255
        switch User.sharedUser.language{
        case 0:
            buttonMorePrice.setTitle("More", for: .normal)
        case 1:
            buttonMorePrice.setTitle("더보기", for: .normal)
        default:
            break
        }
        buttonMorePrice.tag = 0
        //0이면 펼치기
        //1이면 닫기
        self.contentView.addSubview(buttonMorePrice)
        buttonMorePrice.titleEdgeInsets.right = 0
        buttonMorePrice.snp.makeConstraints { (make) in
            make.top.equalTo(self.labelPriceDetail.snp.bottom).offset(self.screenFrameWidth * 0.04)//13/360
            make.right.equalTo(self.buttonMoreDetail)//.offset(self.screenFrameWidth * -0.1)//35/360
        }
        buttonMorePrice.addTarget(self, action: #selector(self.tappedMorePrice(btn:)), for: .touchUpInside)
        
        //useTime icon
        let useTimeIcon = UIImageView()
        useTimeIcon.image = #imageLiteral(resourceName: "icon_clock")
        self.contentView.addSubview(useTimeIcon)
        useTimeIcon.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.07)//25/360
            make.top.equalTo(buttonMorePrice.snp.bottom).offset(self.screenFrameWidth * 0.14)//50/360
        }
        
        //useTime title
        let useTimeTitle = UILabel()
        switch User.sharedUser.language {
        case 0:
            useTimeTitle.text = "Use time"
        case 1:
            useTimeTitle.text = "영업시간"
        default:
            break
        }
        
        useTimeTitle.textColor = identityColor()
        useTimeTitle.numberOfLines = 0
        self.contentView.addSubview(useTimeTitle)
        useTimeTitle.font = UIFont(name: useTimeTitle.font.fontName, size: 16)
        useTimeTitle.sizeToFit()
        useTimeTitle.snp.makeConstraints { (make) in
            make.height.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(useTimeIcon.snp.right).offset(self.screenFrameWidth * 0.01)//5/360
            make.top.equalTo(useTimeIcon)
        }
        
        //useTime detail
        self.labelUseTimeDetail.text = (self.detailDict["useTime"] as! String).html2String
        self.contentView.addSubview(self.labelUseTimeDetail)
        self.labelUseTimeDetail.font = UIFont(name: self.labelUseTimeDetail.font.fontName, size: self.cgFloatDetailFontSize)
        self.labelUseTimeDetail.numberOfLines = 4
        self.labelUseTimeDetail.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.82)//(123+10.5+121.5+41)/360
//            make.height.equalTo(self.screenFrameWidth * 0.41)//(38+7+38+7+58)/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.09)//31/360
            make.top.equalTo(useTimeTitle.snp.bottom).offset(self.screenFrameWidth * 0.04)//16/360
        }
        self.labelUseTimeDetail.sizeToFit()
        
        //more more useTime button
        let buttonMoreUseTime = UIButton(type: .custom)
        buttonMoreUseTime.setTitleColor(UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1), for: .normal)//139/255
        switch User.sharedUser.language{
        case 0:
            buttonMoreUseTime.setTitle("More", for: .normal)
        case 1:
            buttonMoreUseTime.setTitle("더보기", for: .normal)
        default:
            break
        }
        buttonMoreUseTime.tag = 0
        //0이면 펼치기
        //1이면 닫기
        self.contentView.addSubview(buttonMoreUseTime)
        buttonMoreUseTime.titleEdgeInsets.right = 0
        buttonMoreUseTime.snp.makeConstraints { (make) in
            make.top.equalTo(self.labelUseTimeDetail.snp.bottom).offset(self.screenFrameWidth * 0.04)//13/360
            make.right.equalTo(self.buttonMoreDetail)//.offset(self.screenFrameWidth * -0.1)//35/360
        }
        buttonMoreUseTime.addTarget(self, action: #selector(self.tappedMoreUseTime(btn:)), for: .touchUpInside)
        
        
        //map icon
        let mapIcon = UIImageView()
        mapIcon.image = #imageLiteral(resourceName: "icon_map")
        self.contentView.addSubview(mapIcon)
        mapIcon.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.03)//12/360
            make.height.equalTo(self.screenFrameWidth * 0.04)//16.3/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.07)//25/360
            make.top.equalTo(buttonMoreUseTime.snp.bottom).offset(self.screenFrameWidth * 0.14)//50/360
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
