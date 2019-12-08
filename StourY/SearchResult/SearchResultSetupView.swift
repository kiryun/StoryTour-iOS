//
//  SearchSetupView.swift
//  StourY
//
//  Created by 김기현 on 15/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
//import Tags//https://github.com/pikachu987/Tags

extension SearchResultVC: UITextFieldDelegate{
    func setupNaviBar(){
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
            make.height.equalTo(self.screenFrameWidth * 0.25) //62 / 360 (=0.17)
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
        
        
        //backBtn in navBar
        let buttonBack = UIButton(type: .custom)
        buttonBack.setImage(UIImage(named: "btn_back_black"), for: .normal)
        navBarView.addSubview(buttonBack)
        buttonBack.frame.origin.x = self.screenFrameWidth * 0.06 //20/360
        buttonBack.frame.origin.y = self.screenFrameWidth * 0.1 //40/360
        buttonBack.frame.size.width = self.screenFrameWidth * 0.04 //15/360
        buttonBack.frame.size.height = self.screenFrameWidth * 0.07 //25/360
        buttonBack.addTarget(self, action: #selector(self.tappedBack(btn:)), for: .touchUpInside)
        
        //searchBarView in navBar
        let searchBarView = UIView()
        searchBarView.backgroundColor = .white
        navBarView.addSubview(searchBarView)
        //searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.layer.borderColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1).cgColor //185 108 117
        searchBarView.layer.borderWidth = 2.0
        searchBarView.snp.makeConstraints({ (make) in
            make.height.equalTo(self.screenFrameWidth * 0.08) // (13.6+14.5)/360
            make.width.equalTo(self.screenFrameWidth * 0.7) // 290/360
            make.centerX.equalTo(self.view)
//            make.left.equalTo(buttonBack.snp.right).offset(self.screenFrameWidth * 0.04)
            make.top.equalTo(buttonBack)
        })
        
        //searchBarText in searchBarView
        self.searchBarText.tintColor = .black
        searchBarView.addSubview(self.searchBarText)
        self.searchBarText.font = UIFont(name: (self.searchBarText.font?.fontName)!, size: 12)
        self.searchBarText.text = self.stringQuery
//        self.searchBarText.sizeToFit()
        self.searchBarText.clearsOnBeginEditing = true
        self.searchBarText.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.8)
            make.top.equalTo(searchBarView).offset(self.screenFrameWidth * 0.01)
            make.centerY.equalTo(searchBarView)
            make.left.equalTo(searchBarView).offset(self.screenFrameWidth * 0.01)
        }
//        self.searchBarText.return
        
        //searchBarButton in searchBarView
        let searchBarButton = UIButton()
        searchBarView.addSubview(searchBarButton)
        searchBarButton.setImage(#imageLiteral(resourceName: "search"), for: .normal)
        searchBarButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.04)
            make.centerY.equalTo(searchBarText)
            make.right.equalTo(searchBarView).offset(self.screenFrameWidth * -0.03)//
//            make.right.equalTo(searchBarView).offset(-16.2)
        }
        searchBarButton.addTarget(self, action: #selector(self.tappedSearch(btn:)), for: .touchUpInside)
    }
    
    func setupView(){
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navBar.snp.bottom)
            make.bottom.left.right.equalTo(self.view)
        }
        
        let sizeTableLoading = CGSize(width: 30, height: 30)
        self.loadingTableView.frame.size = sizeTableLoading
        //        let loading = NVActivityIndicatorView(frame: frameLoading, type: .ballGridBeat, color: identityColor())
        self.view.addSubview(self.loadingTableView)
        self.loadingTableView.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.tableView)
//            make.top.equalTo(self.navBar.snp.bottom).offset(15)
            make.center.equalTo(self.tableView)
        }
        self.loadingTableView.startAnimating()
        
        let viewFilterShadow = UIView()
        viewFilterShadow.backgroundColor = .white
        viewSetShadow(view: viewFilterShadow)
        self.view.addSubview(viewFilterShadow)
//        viewFilterShadow.bounds.size = CGSize(width: self.screenFrameWidth * 0.35, height: self.screenFrameWidth * 0.1)
        viewFilterShadow.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.35)//126/360
            make.height.equalTo(self.screenFrameWidth * 0.1)//35/360
            make.left.equalTo(self.view).offset(self.screenFrameWidth * 0.33)//120/360
            make.bottom.equalTo(self.view).offset(self.screenFrameWidth * -0.13)//46/360
        }
        
        let buttonSetupFilter = UIButton(type: .custom)
        buttonSetupFilter.backgroundColor = .white
        viewSetRadius(view: buttonSetupFilter, radius: 17, color: false)
        buttonSetupFilter.setImage(UIImage(named: "icon_filter"), for: .normal)
        buttonSetupFilter.setTitleColor(.black, for: .normal)
        switch User.sharedUser.language {
        case 0:
            buttonSetupFilter.setTitle("Filter", for: .normal)
        case 1:
            buttonSetupFilter.setTitle("필터 적용하기", for: .normal)
        default:
            buttonSetupFilter.setTitle("Filter", for: .normal)
        }
        viewFilterShadow.addSubview(buttonSetupFilter)
        buttonSetupFilter.titleLabel?.font = UIFont(name: (buttonSetupFilter.titleLabel?.font.fontName)!, size: 10)
        buttonSetupFilter.imageEdgeInsets.left = 5
        buttonSetupFilter.titleEdgeInsets.left = 15
//        buttonSetupFilter.titleLabel?.textAlignment = .center
        buttonSetupFilter.snp.makeConstraints { (make) in
            make.width.height.equalTo(viewFilterShadow)
            make.center.equalTo(viewFilterShadow)
        }
        buttonSetupFilter.addTarget(self, action: #selector(self.tappedSetupFilter(btn:)), for: .touchUpInside)
        
        self.viewBackgroundFilter.backgroundColor = .black
        self.viewBackgroundFilter.alpha = 0.4
        self.view.addSubview(self.viewBackgroundFilter)
        self.viewBackgroundFilter.frame = CGRect(x: 0, y: 0, width: self.screenFrameWidth, height: self.view.frame.height)
        self.viewBackgroundFilter.isHidden = true
        
        self.viewBottom.backgroundColor = .white
        self.view.addSubview(self.viewBottom)
        self.viewBottom.frame = CGRect(x: 0, y: self.view.frame.height * 0.5, width: self.screenFrameWidth, height: self.view.frame.height)
        self.viewBottom.isHidden = true
        
        self.viewFilter.backgroundColor = .white
        viewSetRadius(view: self.viewFilter, radius: 10.0, color: false)
        self.view.addSubview(self.viewFilter)
        self.viewFilter.isHidden = true
        self.viewFilter.frame = CGRect(x: 0, y: self.view.frame.height, width: self.screenFrameWidth, height: self.view.frame.height * 0.65)
        
        
        //filter labels
        let labelFilterTitle = UILabel()
        let labelFilterLocation = UILabel()
        let labelFilterCategory = UILabel()
        switch User.sharedUser.language {
        case 0:
            labelFilterTitle.text = "Fitler"
            labelFilterLocation.text = "Location"
            labelFilterCategory.text = "Category"
        case 1:
            labelFilterTitle.text = "필터"
            labelFilterLocation.text = "지역"
            labelFilterCategory.text = "카테고리"
        default:
            labelFilterTitle.text = "Fitler"
            labelFilterLocation.text = "Location"
            labelFilterCategory.text = "Category"
        }
        
        //label filter title
        labelFilterTitle.textColor = identityColor()
        viewFilter.addSubview(labelFilterTitle)
        labelFilterTitle.font = UIFont(name: labelFilterTitle.font.fontName, size: 19)
        labelFilterTitle.sizeToFit()
        labelFilterTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewFilter).offset(self.screenFrameWidth * 0.05)//18/360
            make.left.equalTo(self.viewFilter).offset(self.screenFrameWidth * 0.12)//43/360
        }
        
        //filter icon
        let imageViewFilter = UIImageView()
        imageViewFilter.image = UIImage(named: "icon_filter")
        self.viewFilter.addSubview(imageViewFilter)
        imageViewFilter.snp.makeConstraints { (make) in
            make.height.equalTo(labelFilterTitle)
            make.width.equalTo(imageViewFilter.snp.height)//16/360
            make.top.equalTo(labelFilterTitle)//.offset(self.screenFrameWidth * 0.06)//19.8/360
            make.right.equalTo(labelFilterTitle.snp.left).offset(self.screenFrameWidth * -0.01)// 4.4/360  //22.6/360
        }
        
        //filter reset
        let buttonFilterReset = UIButton(type: .custom)
        buttonFilterReset.setTitleColor(identityColor(), for: .normal)
        switch User.sharedUser.language {
        case 0:
            buttonFilterReset.setTitle("Reset", for: .normal)
        case 1:
            buttonFilterReset.setTitle("초기화", for: .normal)
        default:
            buttonFilterReset.setTitle("Reset", for: .normal)
        }
        self.viewFilter.addSubview(buttonFilterReset)
        buttonFilterReset.snp.makeConstraints { (make) in
            make.right.equalTo(self.viewFilter).offset(self.screenFrameWidth * -0.06)//21/360
            make.centerY.equalTo(labelFilterTitle)
        }
        buttonFilterReset.addTarget(self, action: #selector(self.tappedReset(btn:)), for: .touchUpInside)
        
        let viewLine = UIView()
        viewLine.backgroundColor = UIColor(red: 0.58, green: 0.58, blue: 0.58, alpha: 1)//208/255
        self.viewFilter.addSubview(viewLine)
        viewLine.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(1)
            make.top.equalTo(labelFilterTitle.snp.bottom).offset(self.screenFrameWidth * 0.04)//13/360
            make.left.equalTo(self.viewFilter)
        }
        
        //label filter location
        labelFilterLocation.textColor = .black
        self.viewFilter.addSubview(labelFilterLocation)
        labelFilterLocation.font = UIFont(name: labelFilterLocation.font.fontName, size: 19)
        labelFilterLocation.snp.makeConstraints { (make) in
            make.top.equalTo(viewLine.snp.bottom).offset(self.screenFrameWidth * 0.06)//20/360
            make.left.equalTo(imageViewFilter)
        }

        //tags location
        self.viewTagsLocation.removeAll()
        switch User.sharedUser.language {
        case 0:
            self.viewTagsLocation.append(contentsOf: self.arrayTagsLocationENG)//["Hongdae", "Gangnam", "Gwanghwamun", "Geondae", "Jong-ro", "Direct input"])
        case 1:
            self.viewTagsLocation.append(contentsOf: self.arrayTagsLocationKOR)//["홍대","강남","광화문","건대","종로","직접입력"])
        default:
            self.viewTagsLocation.append(contentsOf: self.arrayTagsLocationENG)//["Hongdae", "Gangnam", "Gwanghwamun", "Geondae", "Jong-ro", "Direct input"])
        }
        self.viewFilter.addSubview(self.viewTagsLocation)

        self.viewTagsLocation.snp.makeConstraints { (make) in
            make.top.equalTo(labelFilterLocation.snp.bottom).offset(self.screenFrameWidth * 0.04)//
            make.left.equalTo(self.viewFilter).offset(self.screenFrameWidth * 0.06)//20/360
            make.right.equalTo(buttonFilterReset)
        }
        for i in 0 ..< self.viewTagsLocation.tagArray.count{
            self.viewTagsLocation.tagArray[i].tag = i + 100
            self.viewTagsLocation.tagArray[i].addTarget(self, action: #selector(self.tappedTagLocation(btn:)), for: .touchUpInside)
        }
        
        //label filter category
        labelFilterCategory.textColor = .black
        self.viewFilter.addSubview(labelFilterCategory)
        labelFilterCategory.font = UIFont(name: labelFilterCategory.font.fontName, size: 19)
        labelFilterCategory.snp.makeConstraints { (make) in
            make.top.equalTo(viewTagsLocation.snp.bottom).offset(self.screenFrameWidth * 0.06)//20/360
            make.left.equalTo(imageViewFilter)
        }

        //tags category
        self.viewTagsCategory.removeAll()
        switch User.sharedUser.language {
        case 0:
            self.viewTagsCategory.append(contentsOf: self.arrayTagsCategoryENG)//["Nature Spot", "History Tourist Attractions", "Resort", "Experiential Sightseeing Spots", "Industrial tourism", "Street", "Western food", "Oriental food", "Vegetarian restaurant", "Bar / Cafe", "Festival"])
        case 1:
            self.viewTagsCategory.append(contentsOf: self.arrayTagsCategoryKOR)//["자연관광","역사관광지","휴양관광지","체험관광지","산업관광지","거리", "서양식", "동양식", "채식전문점", "바/카페", "축제"])
        default:
            self.viewTagsCategory.append(contentsOf: self.arrayTagsCategoryENG)//["Nature Spot", "History Tourist Attractions", "Resort", "Experiential Sightseeing Spots", "Industrial tourism", "Street", "Western food", "Oriental food", "Vegetarian restaurant", "Bar / Cafe", "Festival"])
        }
        self.viewFilter.addSubview(self.viewTagsCategory)
        self.viewTagsCategory.snp.makeConstraints { (make) in
            make.top.equalTo(labelFilterCategory.snp.bottom).offset(self.screenFrameWidth * 0.04)//
            make.left.equalTo(viewTagsLocation)//.offset(self.screenFrameWidth * 0.06)//20/360
            make.right.equalTo(buttonFilterReset)
        }
        for i in 0 ..< self.viewTagsCategory.tagArray.count{
            self.viewTagsCategory.tagFont = .systemFont(ofSize: 12)
            self.viewTagsCategory.tagArray[i].tag = i + 100
            self.viewTagsCategory.tagArray[i].addTarget(self, action: #selector(self.tappedTagCategory(btn:)), for: .touchUpInside)
        }
//        viewTagsCategory.tagArray[0].addTarget(self, action: #selector(self.tappedBack(btn:)), for: .touchUpInside)
        
        //confirm button
        let buttonConfirmFilter = UIButton(type: .custom)
        buttonConfirmFilter.backgroundColor = identityColor()
        switch User.sharedUser.language {
        case 0:
            buttonConfirmFilter.setTitle("Confirm", for: .normal)
        case 1:
            buttonConfirmFilter.setTitle("필터 적용하기", for: .normal)
        default:
            buttonConfirmFilter.setTitle("Confirm", for: .normal)
        }
        self.viewFilter.addSubview(buttonConfirmFilter)
        buttonConfirmFilter.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.13) // 45/360
            make.left.equalTo(self.viewFilter)
            make.bottom.equalTo(self.viewFilter)
        }
        buttonConfirmFilter.addTarget(self, action: #selector(self.tappedConfirmFilter(btn:)), for: .touchUpInside)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("searchResultVC.textFieldShouldReturn")
        //textField code
        textField.resignFirstResponder()  //if desired
        self.tappedReturn()
        return true
    }
}
