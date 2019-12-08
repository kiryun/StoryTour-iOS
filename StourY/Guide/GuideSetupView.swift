//
//  GuideSetupView.swift
//  StourY
//
//  Created by 김기현 on 13/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

//setup view
extension GuideVC{
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
    }
    
    func setupView(){
        //master view
        self.guideView.backgroundColor = .white
        self.guideView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navBar.snp.bottom)
        }
        
        //containerViewCollection
        self.containerViewCollection.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.97) //350/360
            make.top.equalTo(self.view).offset(self.screenFrameWidth * 0.29) //104/360
            make.centerX.equalTo(self.view)
        }
        
        //collection loading
        let sizeContainterViewCollection = CGSize(width: 30, height: 30)
        self.loadingContainterViewCollection.frame.size = sizeContainterViewCollection
        self.containerViewCollection.addSubview(self.loadingContainterViewCollection)
        self.loadingContainterViewCollection.snp.makeConstraints { (make) in
            make.center.equalTo(self.containerViewCollection)
        }
        self.loadingContainterViewCollection.startAnimating()
//        //name_kor
//        self.guideView.addSubview(self.nameKor)
//        self.nameKor.font = UIFont(name: self.nameKor.font.fontName, size: 18)
//        self.nameKor.sizeToFit()
//        self.nameKor.snp.makeConstraints { (make) in
//            make.top.equalTo(self.view).offset(self.screenFrameWidth * 1.32)// 474/360
//            make.centerX.equalTo(self.view)
//        }
//        self.nameKor.textColor = .clear
//        
//        //name_user language
//        self.guideView.addSubview(self.nameUserLang)
//        self.nameUserLang.font = UIFont(name: self.nameUserLang.font.fontName, size: 17)
//        self.nameUserLang.sizeToFit()
//        self.nameUserLang.snp.makeConstraints { (make) in
//            make.top.equalTo(self.nameKor).offset(2)
//            make.centerX.equalTo(self.view)
//        }
//        self.nameUserLang.textColor = .clear
        
        //buttonsView
        let buttonsView = UIView()
        self.guideView.addSubview(buttonsView)
        buttonsView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.68) //(120+120+5)/360
            make.height.equalTo(self.screenFrameWidth * 0.1) //32/360
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(self.screenFrameWidth * 1.47) // 529/360
        }
        
        //audio guide button
        let audioButton = UIButton()
        buttonsView.addSubview(audioButton)
        audioButton.backgroundColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1)
        audioButton.layer.borderColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1).cgColor //185 108 117
        audioButton.layer.borderWidth = 1.0
        audioButton.layer.cornerRadius = 20.0
        audioButton.setImage(#imageLiteral(resourceName: "icon_voice"), for: .normal)
        audioButton.imageEdgeInsets.left = 5
        switch User.sharedUser.language{
        case 0:
            audioButton.setTitle("Audio", for: .normal)
        case 1:
            audioButton.setTitle("음성가이드", for: .normal)
        default:
            break
        }
        audioButton.titleLabel?.font = UIFont(name: (audioButton.titleLabel?.font.fontName)!, size: 10)
        audioButton.titleEdgeInsets.left = 20
        audioButton.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.3)//120/360
            make.height.equalTo(buttonsView)//32/360
            make.top.left.equalTo(buttonsView)
        }
        audioButton.addTarget(self, action: #selector(self.tappedAudio(btn: )), for: .touchUpInside)
        
        //cartoon guide button
        let toonButton = UIButton()
        buttonsView.addSubview(toonButton)
        toonButton.backgroundColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1)
        toonButton.layer.borderColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1).cgColor //185 108 117
        toonButton.layer.borderWidth = 1.0
        toonButton.layer.cornerRadius = 20.0
        toonButton.setImage(#imageLiteral(resourceName: "icon_toon"), for: .normal)
        toonButton.imageEdgeInsets.left = 5
        switch User.sharedUser.language{
        case 0:
            toonButton.setTitle("Toon", for: .normal)
        case 1:
            toonButton.setTitle("가이드 툰", for: .normal)
        default:
            break
        }
        toonButton.titleLabel?.font = UIFont(name: (toonButton.titleLabel?.font.fontName)!, size: 10)
        toonButton.titleEdgeInsets.left = 20
        toonButton.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.3)//120/360
            make.height.equalTo(buttonsView)//32/360
            make.top.right.equalTo(buttonsView)
        }
        toonButton.addTarget(self, action: #selector(self.tappedToon(btn: )), for: .touchUpInside)
    }
    
    @objc func tappedAudio(btn: UIButton){
        print("GuideVC.tappedAudio")
        let toonAudioGuideVC = self.storyboard?.instantiateViewController(withIdentifier: "ToonAudioGuideVC") as! ToonAudioGuideVC
//        print(self.guideList[self.guideCollection.intNowIndex].name!)
        toonAudioGuideVC.attrIdx = self.guideList[self.guideCollection.intNowIndex].idx!
        toonAudioGuideVC.lat = self.guideList[self.guideCollection.intNowIndex].lat!
        toonAudioGuideVC.lon = self.guideList[self.guideCollection.intNowIndex].lon!
        toonAudioGuideVC.intFirstSegementVal = 0
        
        self.present(toonAudioGuideVC, animated: true, completion: nil)
    }
    @objc func tappedToon(btn: UIButton){
        print("GuideVC.tappedToon")
        let toonAudioGuideVC = self.storyboard?.instantiateViewController(withIdentifier: "ToonAudioGuideVC") as! ToonAudioGuideVC
//        print(self.guideList[self.guideCollection.intNowIndex].name!)
        toonAudioGuideVC.attrIdx = self.guideList[self.guideCollection.intNowIndex].idx!
        toonAudioGuideVC.lat = self.guideList[self.guideCollection.intNowIndex].lat!
        toonAudioGuideVC.lon = self.guideList[self.guideCollection.intNowIndex].lon!
        toonAudioGuideVC.intFirstSegementVal = 1
        self.present(toonAudioGuideVC, animated: true, completion: nil)
    }
}
