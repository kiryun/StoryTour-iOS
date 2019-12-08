//
//  SearchVC.swift
//  StourY
//
//  Created by 김기현 on 14/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UITextFieldDelegate {
    var screenFrameWidth = UIScreen.main.bounds.width
    
    var navBar: UINavigationBar!

    @IBOutlet weak var searchView: UIView!
    let searchBarText = UITextField()
    var searchFlag = false
    
    var lat: Double!
    var lon: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBarText.delegate = self
        self.setupNaviBar()
        self.setupView()
        print(self.lat)
        print(self.lon)
    }
    
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
            make.height.equalTo(self.screenFrameWidth * 0.3) //116 / 360
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
//        buttonBack.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.04)//15/360
//            make.height.equalTo(self.screenFrameWidth * 0.07)//25/360
//            make.top.equalTo(navBarView).offset(self.screenFrameWidth * 0.1)//40/360
//            make.left.equalTo(navBarView).offset(self.screenFrameWidth * 0.06)//20/360
//        }
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
            title.text = "Explore"
        case 1:
            title.text = "검색"
        default:
            break
        }
        title.sizeToFit()
        
        //searchBarView in navBar
        let searchBarView = UIView()
        searchBarView.backgroundColor = .white
        navBarView.addSubview(searchBarView)
        //searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.layer.borderColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1).cgColor //185 108 117
        searchBarView.layer.borderWidth = 2.0
        searchBarView.layer.cornerRadius = 20.0
        searchBarView.snp.makeConstraints({ (make) in
            make.height.equalTo(self.screenFrameWidth * 0.1) // 35/360
            make.width.equalTo(self.screenFrameWidth * 0.8) // 290/360
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.navBar).offset(self.screenFrameWidth * 0.18) // 65/360
        })
        
        //searchBarText in searchBarView
        
//        self.searchBarText.textColor = backgroundColor()
        
        self.searchBarText.tintColor = .black
//        self.searchBarText.return
        searchBarView.addSubview(self.searchBarText)
        self.searchBarText.font = UIFont(name: (self.searchBarText.font?.fontName)!, size: 12)
        switch User.sharedUser.language{
        case 0:
            self.searchBarText.text = "Find your tour location"
        case 1:
            self.searchBarText.text = "관광지/맛집/지역 등을 검색해보세요." //language에 따라서
        default:
            break
        }
        self.searchBarText.sizeToFit()
        self.searchBarText.clearsOnBeginEditing = true
        self.searchBarText.snp.makeConstraints { (make) in
//            make.center.equalTo(searchBarView)
            make.width.equalTo(self.screenFrameWidth * 0.6) //173/360
            make.centerY.equalTo(searchBarView)
            make.left.equalTo(searchBarView).offset(self.screenFrameWidth * 0.03)
        }
        //searchBarButton in searchBarView
        let searchBarButton = UIButton()
        searchBarView.addSubview(searchBarButton)
        searchBarButton.setImage(#imageLiteral(resourceName: "search"), for: .normal)
        searchBarButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(searchBarText)
            make.right.equalTo(searchBarView).offset(self.screenFrameWidth * -0.05)//16.2/360
        }
        searchBarButton.addTarget(self, action: #selector(self.tappedSearch(btn:)), for: .touchUpInside)
    }
    
    
    func setupView(){
        self.searchView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1) // 245 245 245 255
        self.searchView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navBar.snp.bottom)
            make.left.right.bottom.equalTo(self.view)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("searchVC.textFieldShouldReturn")
        //textField code
        textField.resignFirstResponder()  //if desired
        self.tappedReturn()
        return true
    }
    
}
