//
//  HomeSetupView.swift
//  StourY
//
//  Created by 김기현 on 03/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension HomeVC{
    func initNavigationBar(){
        //navBar
        self.navBar = UINavigationBar()
        self.navBar.tintColor = .white // tintColor가 naviBar 줄임
        self.navBar.setBackgroundImage(UIImage(), for: .default)
        self.navBar.shadowImage = UIImage() // 이거 있어야 중간에 선없음
        self.navBar.isHidden = true // 첨엔 navi 아예 view에 안보여짐
        viewSetShadow(view: self.navBar)
        self.view.addSubview(self.navBar)
        
        self.navBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.19) //70 / 360
        }
        
        //navBarView
        let navBarView = UIView()
        navBarView.backgroundColor = .white //
        self.navBar.addSubview(navBarView)
        navBarView.snp.makeConstraints { (make) in
            make.width.equalTo(self.navBar)
            make.height.equalTo(self.navBar)
            make.top.equalTo(self.navBar)
        }
        
        //segmentController in navigationBar
        self.naviBarSegmentctrl = NavigationSegmentController()
        navBarView.addSubview(self.naviBarSegmentctrl)
        self.naviBarSegmentctrl.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        let alphaColor = UIColor(hue: 1, saturation: 0, brightness: 0, alpha: 0)
        self.naviBarSegmentctrl.borderColor = alphaColor
        self.naviBarSegmentctrl.textColor = alphaColor
        self.naviBarSegmentctrl.selectorColor = alphaColor
        self.naviBarSegmentctrl.selectorTextColor = alphaColor
        switch User.sharedUser.language {
        case 0:
            self.naviBarSegmentctrl.commaSeperatedButtonTitles = "All, Tour, Food"//"Recommand Places, Sightseeing spots, Restaurants"
        case 1:
            self.naviBarSegmentctrl.commaSeperatedButtonTitles = "추천장소, 관광지, 맛집"
        default:
            self.naviBarSegmentctrl.commaSeperatedButtonTitles = "All, Tour, Food"//"Recommand Places, Sightseeing spots, Restaurants"
        }
        self.naviBarSegmentctrl.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.81) //(360-34-34)/360
            make.height.equalTo(self.screenFrameWidth * 0.07)//25/360
            //make.top.equalTo(navBarView).offset(self.screenFrameWidth * 0.13)//45/360
            make.bottom.equalTo(navBarView)
            make.centerX.equalTo(self.view)
        }
        self.naviBarSegmentctrl.addTarget(self, action: #selector(self.onChangeOfSegment), for: .valueChanged)
    }
    
    func initView(){
        
        //topView
        self.topView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1) //나중에 지워
        self.topView.frame.size.width = self.screenFrameWidth
        self.topView.frame.size.height = (self.screenFrameWidth * 1.39) // 499/360
        
        //titleView
        self.titleView.image = UIImage(named: "bg_main")
        self.topView.addSubview(titleView)
        self.titleView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.56) //200/360
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.topView)
        }
//        self.view.bringSubview(toFront: self.titleView)
        
        //current gps butotn
        let currentGpsButton = UIButton(type: .custom)
        currentGpsButton.setImage(#imageLiteral(resourceName: "icon_gps"), for: .normal)
        switch User.sharedUser.language {
        case 0:
            currentGpsButton.setTitle("Set locale", for: .normal)
        case 1:
            currentGpsButton.setTitle("위치 설정", for: .normal)
        default:
            currentGpsButton.setTitle("Set locale", for: .normal)
        }
        currentGpsButton.setTitleColor(.white, for: .normal)
        self.topView.addSubview(currentGpsButton)
        currentGpsButton.imageEdgeInsets.left = 0
        currentGpsButton.titleEdgeInsets.left = 21
        currentGpsButton.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.4)// * 0.24)//(15+6+64)//360
            make.height.equalTo(self.screenFrameWidth * 0.07)//17/360(=0.05)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.titleView).offset(self.screenFrameWidth * 0.1)//27/360(=0.8)
        }
        currentGpsButton.addTarget(self, action: #selector(self.tappedCurrentGPSButton), for: .touchUpInside)
        
        //recommandViewGuardLine
        self.recommandViewGuardLine.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        topView.addSubview(recommandViewGuardLine)
        self.recommandViewGuardLine.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.56)//200/360
            make.centerX.equalTo(self.view)
            //make.top.equalTo(self.topView).offset(self.screenFrameWidth * 0.55) // 199/360
            make.top.equalTo(self.titleView.snp.bottom)
        }
        
        //collectionView in recommandViewGuardLine
        self.collectionView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        self.recommandViewGuardLine.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.3)//(99+6+15)/360
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.recommandViewGuardLine).offset(self.screenFrameWidth * 0.14)//49/360
        }
        
        //collection loading bar
//        let x = self.collectionView.frame.origin.x + self.collectionView.frame.size.width * 0.5
//        let y = self.collectionView.frame.origin.y + self.collectionView.frame.size.height * 0.5
//        print(self.collectionView.frame.size.height * 0.5)
        let sizeCollectionLoading = CGSize(width: 30, height: 30)
        self.loadingCollectionView.frame.size = sizeCollectionLoading
        //        let loading = NVActivityIndicatorView(frame: frameLoading, type: .ballGridBeat, color: identityColor())
        self.view.addSubview(self.loadingCollectionView)
        self.loadingCollectionView.snp.makeConstraints { (make) in
            make.center.equalTo(self.collectionView)
            
        }
        self.loadingCollectionView.startAnimating()
        
        //searchBarShadow
        viewSetShadow(view: self.searchBarShadow)
        self.topView.addSubview(self.searchBarShadow)
        self.searchBarShadow.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.83)//299/360
            make.height.equalTo(self.screenFrameWidth * 0.1)//37/360
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.topView).offset(self.screenFrameWidth * 0.51)//182/360
        }
        
        //searchBar = UIButton()
//        self.searchBar.setImage(UIImage(named: "img_searchbar_search"), for: .normal)
//        self.searchBar.setImage(UIImage(named: "btn_serch"), for: .normal)
        self.searchBar.backgroundColor = .white
        viewSetRadius(view: self.searchBar, radius: 16, color: false)
        self.searchBar.setTitleColor(UIColor(red: 201/255, green: 201/255, blue: 201/255, alpha: 1), for: .normal)//201 = c9
        self.searchBar.title
        switch User.sharedUser.language {
        case 0:
            self.searchBar.setTitle("Find your tour location", for: .normal)
        case 1:
            self.searchBar.setTitle("관광지/맛집/지역 등을 검색해보세요", for: .normal)
        default:
            self.searchBar.setTitle("Find your tour location", for: .normal)
        }
        self.searchBarShadow.addSubview(self.searchBar)
//        self.searchBar.imageView?.contentMode = .scaleToFill
//        self.searchBar.imageEdgeInsets = UIEdgeInsetsMake(0, 271, 0, 10)
        self.searchBar.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.searchBarShadow)
            make.center.equalTo(self.searchBarShadow)
        }
        self.searchBar.addTarget(self, action: #selector(loadSearchVC), for: .touchUpInside)
        
        //segmentView
        self.segmentView.backgroundColor = .white
        self.topView.addSubview(self.segmentView)
        self.segmentView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.27)//99/360
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.recommandViewGuardLine.snp.bottom)
        }
        
        //viewSegmentCtrl in segmentView
        self.viewSegmentCtrl.frame = CGRect(x: self.screenFrameWidth * 0.13, y: self.screenFrameWidth * 0.09, width: self.screenFrameWidth * 0.75, height: self.screenFrameWidth * 0.09)
        switch User.sharedUser.language {
        case 0:
            self.viewSegmentCtrl.commaSeparatedButtonTitles = "All,Tour,Food"
        case 1:
            self.viewSegmentCtrl.commaSeparatedButtonTitles = "추천장소,관광지,맛집"
        default:
            self.viewSegmentCtrl.commaSeparatedButtonTitles = "All,Tour,Food"
        }
        self.viewSegmentCtrl.borderWidth = 1
        self.viewSegmentCtrl.borderColor = identityColor()
        self.viewSegmentCtrl.selectorColor = identityColor()
        self.viewSegmentCtrl.textColor = .black
        self.viewSegmentCtrl.selectorTextColor = .white
        switch self.nowSelectedTable {
        case 0:
            self.viewSegmentCtrl.selectedSegmentIndex = 0
            self.nowSelectedTable = 0
        case 1:
            self.viewSegmentCtrl.selectedSegmentIndex = 1
            self.nowSelectedTable = 1
        case 2:
            self.viewSegmentCtrl.selectedSegmentIndex = 2
            self.nowSelectedTable = 2
        default:
            break
        }
        self.segmentView.addSubview(self.viewSegmentCtrl)
        //        self.viewSegmentCtrl.snp.makeConstraints { (make) in
        //            make.width.equalTo(self.screenFrameWidth * 0.75)//270/360
        //            make.height.equalTo(self.screenFrameWidth * 0.09)//32/360
        //            make.centerX.equalTo(self.view)
        //            make.left.eqaulTo(self.view).offset(self.screenFrameWidth * 0.13)//45/360
        //            make.top.equalTo(self.segmentView).offset(self.screenFrameWidth * 0.09)//32/360
        //        }
        self.viewSegmentCtrl.addTarget(self, action: #selector(onChangeOfViewSegment), for: .valueChanged)
        
        //tableView loading bar
        //        let x = self.collectionView.frame.origin.x + self.collectionView.frame.size.width * 0.5
        //        let y = self.collectionView.frame.origin.y + self.collectionView.frame.size.height * 0.5
        //        print(self.collectionView.frame.size.height * 0.5)
        let sizeTableLoading = CGSize(width: 30, height: 30)
        self.loadingTableView.frame.size = sizeTableLoading
        //        let loading = NVActivityIndicatorView(frame: frameLoading, type: .ballGridBeat, color: identityColor())
        self.view.addSubview(self.loadingTableView)
        self.loadingTableView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.tableView)
            make.top.equalTo(self.topView.snp.bottom).offset(15)
            
        }
        self.loadingTableView.startAnimating()
    }
}
