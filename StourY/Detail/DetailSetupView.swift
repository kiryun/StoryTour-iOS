//
//  DetailSetupView.swift
//  StourY
//
//  Created by 김기현 on 04/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
import Tags
import TagListView

extension DetailVC{
    func setupView(){
        if self.detailDict["hasGuide"] as! Bool{
            
            //guideAudio button
            self.guideAudioButton.setImage(#imageLiteral(resourceName: "btn_voiceguide"), for: .normal)
            self.guideAudioButton.alpha = 0
            self.view.addSubview(self.guideAudioButton)
            //            self.guideAudioButton.snp.makeConstraints { (make) in
            //                make.width.height.equalTo(self.screenFrameWidth * 0.14)//50/360
            //                make.right.equalTo(self.view).offset(self.screenFrameWidth * -0.09)//34/360
            //                make.left.equalTo(self.view).offset(self.screenFrameWidth * -0.1)//37/360
            //            }
            self.guideAudioButton.removeFromSuperview()
            self.guideAudioButton.addTarget(self, action: #selector(self.tappedAudio(btn:)), for: .touchUpInside)
            
            //guideToon button
            self.guideToonButton.setImage(#imageLiteral(resourceName: "btn_guidetoon"), for: .normal)
            self.guideToonButton.alpha = 0
            self.view.addSubview(self.guideToonButton)
            //            self.guideToonButton.snp.makeConstraints { (make) in
            //                make.width.height.equalTo(self.screenFrameWidth * 0.14)//50/360
            //                make.right.equalTo(self.view).offset(self.screenFrameWidth * -0.09)//34/360
            //                make.bottom.equalTo(self.view).offset(self.screenFrameWidth * -0.1)//37/360
            //            }
            self.guideToonButton.removeFromSuperview()
            self.guideToonButton.addTarget(self, action: #selector(self.tappedToon(btn:)), for: .touchUpInside)
            
            //guide button
            //            let guideButton = UIButton()
            self.guideButton.setImage(#imageLiteral(resourceName: "btn_guide"), for: .normal)
            self.guideButton.tag = 0
            self.view.addSubview(self.guideButton)
            self.guideButton.snp.makeConstraints { (make) in
                make.width.height.equalTo(self.screenFrameWidth * 0.20)//55/360
                make.right.equalTo(self.view).offset(self.screenFrameWidth * -0.09)//32/360
                make.bottom.equalTo(self.view).offset(self.screenFrameWidth * -0.1)//37/360
            }
            self.guideButton.addTarget(self, action: #selector(tappedGuide(btn:)), for: .touchUpInside)
        }
        
        //topImage
        let topImage = UIImageView()
        let thumnailImage = NSURL(string: self.detailDict["thumnailAddr"] as! String)
        if let data = NSData(contentsOf: thumnailImage! as URL){
            topImage.image = UIImage(data: data as Data)
        }
        topImage.contentMode = .scaleAspectFill
        self.contentView.addSubview(topImage)
        topImage.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.64) // 230/360
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(self.contentView)
        }
        
        //filterView
        let filterView = UIView()
        filterView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.35)
        topImage.addSubview(filterView)
        filterView.snp.makeConstraints { (make) in
            make.width.equalTo(topImage)
            make.height.equalTo(topImage)
            make.center.equalTo(topImage)
        }
        
        //backBtn
        let buttonBack = UIButton(type: .custom)
        buttonBack.setImage(UIImage(named: "btn_back_white"), for: .normal)
        self.contentView.addSubview(buttonBack)
        buttonBack.frame.origin.x = self.screenFrameWidth * 0.06 //20/360
        buttonBack.frame.origin.y = self.screenFrameWidth * 0.1 //40/360
        buttonBack.frame.size.width = self.screenFrameWidth * 0.04 //15/360
        buttonBack.frame.size.height = self.screenFrameWidth * 0.07 //25/360
        buttonBack.addTarget(self, action: #selector(self.tappedBack(btn:)), for: .touchUpInside)
        
        //tagSet
        let viewTags = TagListView()
        viewTags.tagBackgroundColor = .clear
        viewTags.cornerRadius = 10
        viewTags.borderWidth = 1
        viewTags.textColor = .white
        viewTags.borderColor = .white//UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        let arrayTags = self.detailDict["tagSet"] as! Array<String>
        viewTags.addTags(arrayTags)
        
        viewTags.alignment = .center
        viewTags.textFont = .systemFont(ofSize: 14)
        viewTags.paddingX = 7
        viewTags.paddingY = 4
        viewTags.marginX = 3
        viewTags.marginY = 3
        filterView.addSubview(viewTags)
        viewTags.snp.makeConstraints { (make) in
            make.top.equalTo(filterView).offset(self.screenFrameWidth * 0.2)//73/360
            //            make.left.equalTo(filterView).offset(self.screenFrameWidth * floatContentInset)//70
            //            make.right.equalTo(filterView).offset(self.screenFrameWidth * -floatContentInset)
            make.left.equalTo(filterView).offset(self.screenFrameWidth * 0.2)
            make.right.equalTo(filterView).offset(self.screenFrameWidth * -0.2)
            make.bottom.equalTo(filterView).offset(self.screenFrameWidth * (175-230)/360)
        }
        
        //viewSummary
        let viewSummaryShadow = UIView()
        viewSetShadow(view: viewSummaryShadow)
        self.contentView.addSubview(viewSummaryShadow)
        viewSummaryShadow.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.92)//330/360
            make.height.equalTo(self.screenFrameWidth * 0.43)//155/360
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.contentView).offset(self.screenFrameWidth * 0.49)//175/360
        }
        
        let viewSummary = UIView()
        viewSummary.backgroundColor = .white
        viewSummary.layer.cornerRadius = 10.0
        viewSummaryShadow.addSubview(viewSummary)
        viewSummary.snp.makeConstraints { (make) in
            make.width.height.top.centerX.equalTo(viewSummaryShadow)
        }
        
        let nameLabel = UILabel()
        nameLabel.text = (detailDict["name"] as! String)
        nameLabel.font = UIFont(name: nameLabel.font.fontName, size: 26)
        nameLabel.numberOfLines = 0
        viewSummary.addSubview(nameLabel)
        nameLabel.sizeToFit()
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(viewSummary)
            make.top.equalTo(viewSummary).offset(self.screenFrameWidth * 0.04)//16/360
        }
        
        let subwayView = UIView()
        viewSummary.addSubview(subwayView)
        subwayView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.26)//(12+4+78)/360
            make.height.equalTo(self.screenFrameWidth * 0.05)//17/360
            make.centerX.equalTo(viewSummary)
            make.top.equalTo(nameLabel.snp.bottom).offset(self.screenFrameWidth * 0.01)//5/360
        }
        
        let subwayIcon = UIImageView()
        subwayIcon.image = #imageLiteral(resourceName: "metro")
        subwayView.addSubview(subwayIcon)
        subwayIcon.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.03)//12/360
            make.height.equalTo(self.screenFrameWidth * 0.04)//14.5
            make.top.equalTo(subwayView)//48/360
            make.left.equalTo(subwayView)//118/360
        }
        
        let subwayName = UILabel()
        subwayName.text = (detailDict["subway"] as! String)
        subwayName.font = UIFont(name: subwayName.font.fontName, size: 17)
        subwayName.numberOfLines = 0
        subwayView.addSubview(subwayName)
        subwayName.sizeToFit()
        subwayName.snp.makeConstraints { (make) in
            make.top.equalTo(subwayView)
            make.left.equalTo(subwayIcon.snp.right).offset(self.screenFrameWidth * 0.01)//4/360
        }
        
        let guardLine1 = UIView()
        guardLine1.backgroundColor = UIColor(red: 0.42, green: 0.42, blue: 0.42, alpha: 1)
        subwayView.addSubview(guardLine1)
        guardLine1.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.88)//316/360
            make.height.equalTo(1)
            make.centerX.equalTo(subwayView)
            make.top.equalTo(subwayName.snp.bottom).offset(self.screenFrameWidth * 0.04)//16/360
        }
        
        let guardLine2 = UIView()
        guardLine2.backgroundColor = UIColor(red: 0.42, green: 0.42, blue: 0.42, alpha: 1)
        viewSummary.addSubview(guardLine2)
        guardLine2.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalTo(self.screenFrameWidth * 0.18)//65/360
            make.left.equalTo(viewSummary).offset(self.screenFrameWidth * 0.31) //110/360
            make.top.equalTo(guardLine1.snp.bottom).offset(self.screenFrameWidth * 0.01)//3.5/360
        }
        
        let guardLine3 = UIView()
        guardLine3.backgroundColor = UIColor(red: 0.42, green: 0.42, blue: 0.42, alpha: 1)
        subwayView.addSubview(guardLine3)
        guardLine3.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalTo(self.screenFrameWidth * 0.18)//65/360
            make.left.equalTo(guardLine2).offset(self.screenFrameWidth * 0.31) //110/360
            make.top.equalTo(guardLine1.snp.bottom).offset(self.screenFrameWidth * 0.01)//3.5/360
        }
        
        //timeSummaryView
        let timeSummaryView = UIView()
        viewSummary.addSubview(timeSummaryView)
        timeSummaryView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.31) //110/360
            make.height.equalTo(self.screenFrameWidth * 0.21) //75/360
            make.left.equalTo(viewSummary)
            make.top.equalTo(guardLine1)
        }
        
        //timeSummaryTitle
        let timeSummaryTitle = UILabel()
        timeSummaryTitle.textColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1)
        timeSummaryTitle.font = UIFont.boldSystemFont(ofSize: 15)
        switch User.sharedUser.language {
        case 0:
            timeSummaryTitle.text = "Operation time"
        case 1:
            timeSummaryTitle.text = "영업시간"
        default:
            break
        }
        timeSummaryTitle.numberOfLines = 0
        timeSummaryView.addSubview(timeSummaryTitle)
        timeSummaryTitle.sizeToFit()
        timeSummaryTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(timeSummaryView)
            make.top.equalTo(timeSummaryView).offset(self.screenFrameWidth * 0.05)//18/360
        }
        
        //timeSummary
        let timeSummary = UILabel()
        timeSummary.text = "-"
        //        if self.type == 100{ // tour
        //            //
        //        }else if self.type == 200{ // restaurant
        //
        //        }
        timeSummary.numberOfLines = 0
        timeSummaryView.addSubview(timeSummary)
        timeSummary.sizeToFit()
        timeSummary.snp.makeConstraints { (make) in
            make.centerX.equalTo(timeSummaryView)
            make.top.equalTo(timeSummaryTitle.snp.bottom).offset(self.screenFrameWidth * 0.02)//18/360
        }
        
        //holidaySummaryView
        let holidaySummaryView = UIView()
        viewSummary.addSubview(holidaySummaryView)
        holidaySummaryView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.31) //110/360
            make.height.equalTo(self.screenFrameWidth * 0.21) //75/360
            make.left.equalTo(guardLine2.snp.right)
            make.top.equalTo(guardLine1)
        }
        
        //holidaySummaryTitle
        let holidaySummaryTitle = UILabel()
        holidaySummaryTitle.textColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1)
        holidaySummaryTitle.font = UIFont.boldSystemFont(ofSize: 15)
        switch User.sharedUser.language {
        case 0:
            holidaySummaryTitle.text = "Holiday"
        case 1:
            holidaySummaryTitle.text = "휴무일"
        default:
            break
        }
        holidaySummaryTitle.numberOfLines = 0
        holidaySummaryView.addSubview(holidaySummaryTitle)
        holidaySummaryTitle.sizeToFit()
        holidaySummaryTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(holidaySummaryView)
            make.top.equalTo(holidaySummaryView).offset(self.screenFrameWidth * 0.05)//18/360
        }
        
        //holidaySummary
        let holidaySummary = UILabel()
        holidaySummary.text = (self.detailDict["holiday"] as! String)
        //        if self.type == 100{ // tour
        //            //
        //        }else if self.type == 200{ // restaurant
        //
        //        }
        holidaySummary.numberOfLines = 0
        holidaySummaryView.addSubview(holidaySummary)
        holidaySummary.sizeToFit()
        holidaySummary.snp.makeConstraints { (make) in
            make.centerX.equalTo(holidaySummaryView)
            make.top.equalTo(holidaySummaryTitle.snp.bottom).offset(self.screenFrameWidth * 0.02)//18/360
        }
        
        //scoreSummaryView
        let scoreSummaryView = UIView()
        viewSummary.addSubview(scoreSummaryView)
        scoreSummaryView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.31) //110/360
            make.height.equalTo(self.screenFrameWidth * 0.21) //75/360
            make.left.equalTo(guardLine3.snp.right)
            make.top.equalTo(guardLine1)
        }
        
        //scoreSummaryTitle
        let scoreSummaryTitle = UILabel()
        scoreSummaryTitle.textColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1)
        scoreSummaryTitle.font = UIFont.boldSystemFont(ofSize: 15)
        switch User.sharedUser.language {
        case 0:
            scoreSummaryTitle.text = "Score"
        case 1:
            scoreSummaryTitle.text = "평점"
        default:
            break
        }
        scoreSummaryTitle.numberOfLines = 0
        scoreSummaryView.addSubview(scoreSummaryTitle)
        scoreSummaryTitle.sizeToFit()
        scoreSummaryTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(scoreSummaryView)
            make.top.equalTo(scoreSummaryView).offset(self.screenFrameWidth * 0.05)//18/360
        }
        
        //scoreSummary
        let scoreSummary = UILabel()
        let score = (self.detailDict["score"] as! Double * 5.0 / 100.0)
        scoreSummary.text = "\(floor( score * 10) / 10) / 5.0"
        //        if self.type == 100{ // tour
        //            //
        //        }else if self.type == 200{ // restaurant
        //
        //        }
        scoreSummary.numberOfLines = 0
        scoreSummaryView.addSubview(scoreSummary)
        scoreSummary.font = UIFont(name: scoreSummary.font.fontName, size: 8)
        scoreSummary.sizeToFit()
        scoreSummary.snp.makeConstraints { (make) in
            make.centerX.equalTo(scoreSummaryView)
            make.top.equalTo(scoreSummaryTitle.snp.bottom).offset(self.screenFrameWidth * 0.01)//18/360 = 0.02
        }
        
        let stackViewScoreStar = UIStackView()
        stackViewScoreStar.distribution = .fillEqually
        var arrayScoreStar = Array<UIImageView>()
        let intScore = Int(score)
        for i in 0 ..< 5{
//            print(i)
            arrayScoreStar.append(UIImageView())
            if i < intScore{
                arrayScoreStar[i].image = UIImage(named: "icon_star") // 완별
            }else if score - Double(intScore) > 0  && i == intScore{
                arrayScoreStar[i].image = UIImage(named: "icon_star_half") // 반별
            }else{//나머지 별
                arrayScoreStar[i].image = UIImage(named: "icon_star_off") // 반별
            }
            stackViewScoreStar.addArrangedSubview(arrayScoreStar[i])
        }
        viewSummary.addSubview(stackViewScoreStar)
        stackViewScoreStar.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.13)// 45/360
            make.height.equalTo(self.screenFrameWidth * 0.02)
            make.centerX.equalTo(scoreSummary)
            make.top.equalTo(scoreSummary.snp.bottom)
//            make.left.equalTo(guardLine3).offset(self.screenFrameWidth * 0.11)//40/360
        }
        
        //likeVisitView
        let likeVisitView = UIView()
        self.contentView.addSubview(likeVisitView)
        likeVisitView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.9)//(160+5+160)/360
            make.height.equalTo(self.screenFrameWidth * 0.09)//32/360
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(viewSummary.snp.bottom).offset(self.screenFrameWidth * 0.03)//10/360
        }
        
        //likeButton view label image
//        let likeButton = UIButton()
        if self.detailDict["liked"] as! Bool{
            self.imageViewLike.image = UIImage(named: "icon_like_on")
            self.labelLike.textColor = .white
            self.viewLike.backgroundColor = identityColor()
        }else{
            self.imageViewLike.image = UIImage(named: "icon_like_off")
            self.labelLike.textColor = .black
            self.viewLike.backgroundColor = .white
        }
        switch User.sharedUser.language {
        case 0:
            self.labelLike.text = "Like"
        case 1:
            self.labelLike.text = "좋아요"
        default:
            self.labelLike.text = "Like"
        }
        likeVisitView.addSubview(self.viewLike)
        self.viewLike.frame.size = CGSize(width: self.screenFrameWidth * 0.44, height: self.screenFrameWidth * 0.09)
        viewSetRadius(view: self.viewLike, radius: self.viewLike.frame.height * 0.5, color: true)
        self.viewLike.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.44)
            make.height.equalTo(self.screenFrameWidth * 0.09)
            make.top.equalTo(likeVisitView)
            make.left.equalTo(likeVisitView)
        }
        likeVisitView.addSubview(self.imageViewLike)
        self.imageViewLike.frame.size = CGSize(width: self.screenFrameWidth * 0.03, height: self.screenFrameWidth * 0.04)
        self.imageViewLike.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.05)//15.2
//            make.height.equalTo(self.screenFrameWidth * 0.04)//14.1
            make.top.equalTo(self.viewLike).offset(self.screenFrameWidth * 0.02)//8.4
            make.left.equalTo(self.viewLike).offset(self.screenFrameWidth * 0.14)//51.7
        }
        likeVisitView.addSubview(self.labelLike)
        self.labelLike.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageViewLike)
            make.left.equalTo(self.imageViewLike.snp.right).offset(2)
        }
        let gestureLike = UITapGestureRecognizer(target: self, action: #selector(self.tappedLike(gesture:)))
        self.viewLike.addGestureRecognizer(gestureLike)
        
        //visitButton view
        self.updateVisitButton()
        likeVisitView.addSubview(self.viewVisit)
        self.viewVisit.frame.size = CGSize(width: self.screenFrameWidth * 0.44, height: self.screenFrameWidth * 0.09)
        viewSetRadius(view: self.viewVisit, radius: self.viewVisit.frame.height * 0.5, color: true)
        self.viewVisit.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.44)
            make.height.equalTo(self.screenFrameWidth * 0.09)
            make.top.equalTo(likeVisitView)
            make.right.equalTo(likeVisitView)
        }
        let gestureVisit = UITapGestureRecognizer(target: self, action: #selector(self.tappedVisit(gesture:)))
        self.viewVisit.addGestureRecognizer(gestureVisit)
        
        //visit image
//        self.updateVisitButton()
        self.viewVisit.addSubview(self.imageViewVisit)
//        make.width.equalTo(self.screenFrameWidth * 0.03)//11.6
//        make.height.equalTo(self.screenFrameWidth * 0.04)//16
        self.imageViewVisit.frame.size = CGSize(width: self.screenFrameWidth * 0.03, height: self.screenFrameWidth * 0.04)
        self.imageViewVisit.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewVisit).offset(self.screenFrameWidth * 0.02)//8.4
            make.left.equalTo(self.viewVisit).offset(self.screenFrameWidth * 0.14)//51.7
        }
        //visit label
        self.viewVisit.addSubview(self.labelVisit)
        self.labelVisit.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageViewVisit)
            make.left.equalTo(self.imageViewVisit.snp.right).offset(2)
        }
        
        //detailIcon
        let detailIcon = UIImageView()
        detailIcon.image = #imageLiteral(resourceName: "icon_info")
        self.contentView.addSubview(detailIcon)
        detailIcon.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.03)//12/360
            make.height.equalTo(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.07)//25/360
            make.top.equalTo(likeVisitView).offset(self.screenFrameWidth * 0.17) //60/360
        }
        
        //detailTitle
        
        switch User.sharedUser.language {
        case 0:
            self.detailTitle.text = "Detail info"
        case 1:
            self.detailTitle.text = "상세정보"
        default:
            break
        }
        self.detailTitle.textColor = identityColor()
        self.detailTitle.numberOfLines = 0
        self.contentView.addSubview(self.detailTitle)
        self.detailTitle.font = UIFont(name: detailTitle.font.fontName, size: 16)
        //        detailTitle.adjustsFontSizeToFitWidth = true
        self.detailTitle.sizeToFit()
        self.detailTitle.snp.makeConstraints { (make) in
            make.height.equalTo(detailIcon)
            make.left.equalTo(detailIcon.snp.right).offset(self.screenFrameWidth * 0.02)//7/360
            //            make.centerY.equalTo(detailTitle)//안됨
            make.top.equalTo(likeVisitView).offset(self.screenFrameWidth * 0.17) //60/360
        }
        
        self.detailText.text = (self.detailDict["summary"] as! String).html2String
        self.contentView.addSubview(self.detailText)
        self.detailText.font = UIFont(name: (self.detailText.font?.fontName)!, size: self.cgFloatDetailFontSize)
        self.detailText.numberOfLines = 4
        self.detailText.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.83)//298/360
//            make.height.equalTo(self.screenFrameWidth * 0.22)//78/360
            make.left.equalTo(self.contentView).offset(self.screenFrameWidth * 0.08)//30/360
            make.top.equalTo(detailTitle.snp.bottom).offset(self.screenFrameWidth * 0.04)//14/360
            
        }
        self.detailText.sizeToFit()
        
        //more moreDetial button
        self.buttonMoreDetail.setTitleColor(UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1), for: .normal)//139/255
        switch User.sharedUser.language{
        case 0:
            self.buttonMoreDetail.setTitle("More", for: .normal)
        case 1:
            self.buttonMoreDetail.setTitle("더보기", for: .normal)
        default:
            break
        }
        self.buttonMoreDetail.tag = 0
        //0이면 펼치기
        //1이면 닫기
        self.contentView.addSubview(self.buttonMoreDetail)
        self.buttonMoreDetail.titleEdgeInsets.right = 0
        self.buttonMoreDetail.snp.makeConstraints { (make) in
            make.top.equalTo(self.detailText.snp.bottom).offset(self.screenFrameWidth * 0.04)//13/360
            make.right.equalTo(self.detailText)//.offset(self.screenFrameWidth * -0.1)//35/360
        }
        self.buttonMoreDetail.addTarget(self, action: #selector(self.tappedMoreDetail(btn:)), for: .touchUpInside)
        
        
        //visit score
        //background view
        self.contentView.addSubview(self.viewVisitScoreMaster)
        self.viewVisitScoreMaster.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.81) //290/360
            make.height.equalTo(self.screenFrameWidth * 0.31)//111/360
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(self.viewVisit).offset(self.screenFrameWidth * 0.08)//28/360
        }
        
        //image
        self.imageViewVisitScore.image = UIImage(named: "bg_visit")
        self.viewVisitScoreMaster.addSubview(self.imageViewVisitScore)
//        self.imageViewVisitScore.frame.size = CGSize(width: self.screenFrameWidth * 0.5, height: self.screenFrameWidth * 0.2)
        self.imageViewVisitScore.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.viewVisitScoreMaster)
            make.center.equalTo(self.viewVisitScoreMaster)
        }
        self.imageViewVisitScore.contentMode = .scaleToFill
        
        
        //label title
        let labelVisitScoreTitle = UILabel()
        switch User.sharedUser.language {
        case 0:
            labelVisitScoreTitle.text = "Please rate the sights!"
        case 1:
            labelVisitScoreTitle.text = "관광지를 평가해주세요!"
        default:
            labelVisitScoreTitle.text = "Please rate the sights!"
        }
        self.viewVisitScoreMaster.addSubview(labelVisitScoreTitle)
        labelVisitScoreTitle.font = .systemFont(ofSize: 15)
        labelVisitScoreTitle.numberOfLines = 1
        labelVisitScoreTitle.sizeToFit()
        labelVisitScoreTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.viewVisitScoreMaster)
            make.top.equalTo(self.viewVisitScoreMaster).offset(self.screenFrameWidth * 0.08)//22.9
        }
        
        //view line
        let viewVisitScoreLine = UIView()
        viewVisitScoreLine.backgroundColor = backgroundColor()//UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        self.viewVisitScoreMaster.addSubview(viewVisitScoreLine)
        viewVisitScoreLine.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.71)//257
            make.height.equalTo(2)
            make.centerX.equalTo(labelVisitScoreTitle)
            make.top.equalTo(labelVisitScoreTitle.snp.bottom).offset(self.screenFrameWidth * 0.01)//
        }
        
        let buttonVisitScoreBad = UIButton(type: .custom)
        let labelVisitScoreBad = UILabel()
        labelVisitScoreBad.font = UIFont(name: labelVisitScoreBad.font.fontName, size: 8)
        switch User.sharedUser.language{
        case 0:
            labelVisitScoreBad.text = "Bad"
        case 1:
            labelVisitScoreBad.text = "별로에요"
        default:
            labelVisitScoreBad.text = "Bad"
        }
        //fine button
        let buttonVisitScoreFine = UIButton(type: .custom)
        let labelVisitScoreFine = UILabel()
        labelVisitScoreFine.font = UIFont(name: labelVisitScoreFine.font.fontName, size: 8)
        switch User.sharedUser.language{
        case 0:
            labelVisitScoreFine.text = "Fine"
        case 1:
            labelVisitScoreFine.text = "괜찮아요"
        default:
            labelVisitScoreFine.text = "Fine"
        }
        //good button label
        let buttonVisitScoreGood = UIButton(type: .custom)
        let labelVisitScoreGood = UILabel()
        labelVisitScoreGood.font = UIFont(name: labelVisitScoreGood.font.fontName, size: 8)
        switch User.sharedUser.language{
        case 0:
            labelVisitScoreGood.text = "Good"
        case 1:
            labelVisitScoreGood.text = "또 갈래요"
        default:
            labelVisitScoreGood.text = "Good"
        }
        buttonVisitScoreBad.setImage(UIImage(named: "icon_bad_off"), for: .normal)
        buttonVisitScoreFine.setImage(UIImage(named: "icon_fine_off"), for: .normal)
        buttonVisitScoreGood.setImage(UIImage(named: "icon_good_off"), for: .normal)
        labelVisitScoreBad.textColor = .black
        labelVisitScoreFine.textColor = .black
        labelVisitScoreGood.textColor = .black
        self.viewVisitScoreMaster.addSubview(buttonVisitScoreBad)
        self.viewVisitScoreMaster.addSubview(buttonVisitScoreFine)
        self.viewVisitScoreMaster.addSubview(buttonVisitScoreGood)
        self.viewVisitScoreMaster.addSubview(labelVisitScoreBad)
        self.viewVisitScoreMaster.addSubview(labelVisitScoreFine)
        self.viewVisitScoreMaster.addSubview(labelVisitScoreGood)
        
        buttonVisitScoreBad.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.07)//25/360
            make.top.equalTo(self.viewVisitScoreMaster).offset(self.screenFrameWidth * 0.16)//57.9/360
            make.left.equalTo(self.viewVisitScoreMaster).offset(self.screenFrameWidth * 0.19)//67/360
        }
        buttonVisitScoreFine.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.07)//25/360
            make.centerX.equalTo(self.viewVisitScoreMaster)
            make.top.equalTo(buttonVisitScoreBad)
        }
        buttonVisitScoreGood.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.07)//25/360
            make.top.equalTo(buttonVisitScoreBad)
            make.right.equalTo(self.viewVisitScoreMaster).offset(self.screenFrameWidth * -0.19)//67/360
        }
        labelVisitScoreBad.snp.makeConstraints { (make) in
            make.centerX.equalTo(buttonVisitScoreBad)
            make.top.equalTo(buttonVisitScoreBad.snp.bottom).offset(self.screenFrameWidth * 0.02)//6/360
        }
        labelVisitScoreFine.snp.makeConstraints { (make) in
            make.centerX.equalTo(buttonVisitScoreFine)
            make.top.equalTo(buttonVisitScoreFine.snp.bottom).offset(self.screenFrameWidth * 0.02)//6/360
        }
        labelVisitScoreGood.snp.makeConstraints { (make) in
            make.centerX.equalTo(buttonVisitScoreGood)
            make.top.equalTo(buttonVisitScoreGood.snp.bottom).offset(self.screenFrameWidth * 0.02)//6/360
        }
        buttonVisitScoreBad.addTarget(self, action: #selector(self.tappedVisitScoreBad(btn:)), for: .touchUpInside)
        buttonVisitScoreFine.addTarget(self, action: #selector(self.tappedVisitScoreFine(btn:)), for: .touchUpInside)
        buttonVisitScoreGood.addTarget(self, action: #selector(self.tappedVisitScoreGood(btn:)), for: .touchUpInside)
        
        self.viewVisitScoreMaster.isHidden = true
        
        if self.type == 100{//tour
            self.initTour()
        }else if self.type == 200{ //restaurant
            self.initRestaurant()
        }
        
    }
    
    func updateVisitButton(){
        print("DetailVC.updateVisitButotn")
        if self.detailDict["visited"] as! Bool{
            switch self.detailDict["myEvaluation"] as! Int{
            case 1:
                self.imageViewVisit.image = UIImage(named: "btn_bad")
            case 2:
                self.imageViewVisit.image = UIImage(named: "btm_fine")//오타아님 디자이너가 적어준거 그대로 쓴거임
            case 3:
                self.imageViewVisit.image = UIImage(named: "btn_good")
            default:
                break
            }
            self.labelVisit.textColor = .white
            self.viewVisit.backgroundColor = identityColor()
        }else{
            self.imageViewVisit.image = UIImage(named: "icon_visit_off")
            self.labelVisit.textColor = .black
            self.viewVisit.backgroundColor = .white
        }
        switch User.sharedUser.language {
        case 0:
            self.labelVisit.text = "Visited"
        case 1:
            self.labelVisit.text = "가봤어요"
        default:
            self.labelVisit.text = "Visited"
        }
    }
}
