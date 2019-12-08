//
//  SignInSetupView.swift
//  StourY
//
//  Created by 김기현 on 28/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension SignInVC{
//    func setupView(){
//        self.view.addSubview(self.btnGLogin)
//        self.btnGLogin.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.view)
//            make.top.equalTo(self.view).offset(self.screenFrameWidth * 0.83)//298/360
//        }
//        self.btnGLogin.addTarget(self, action: #selector(self.selectedGIDSignInButton(_:)), for: .touchUpInside)
//        
//        self.view.addSubview(self.btnFBLogin)
//        self.btnFBLogin.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.btnGLogin)
//            make.top.equalTo(self.btnGLogin.snp.bottom).offset(10)
//        }
//        
//        
//    }
    func setupView(){
        
        
        //backgorund image
        let imgViewBG = UIImageView()
        imgViewBG.image = UIImage(named: "splash_bg")
        self.view.addSubview(imgViewBG)
        imgViewBG.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        imgViewBG.contentMode = .scaleAspectFill
        
        let imgViewText = UIImageView()
        imgViewText.image = UIImage(named: "splash_text")
        self.view.addSubview(imgViewText)
        imgViewText.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.4)//145
            make.height.equalTo(self.screenFrameWidth * 0.16)//58
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(self.screenFrameWidth * 0.42)//150
        }
        imgViewText.contentMode = .scaleAspectFill
        
        //button gid
        self.buttonGIDSignIn.bounds.size = CGSize(width: self.screenFrameWidth * 0.72, height: self.screenFrameWidth * 0.11)
        viewSetRadius(view: self.buttonGIDSignIn, radius: self.buttonGIDSignIn.bounds.size.height * 0.5, color: false)
        self.buttonGIDSignIn.backgroundColor = UIColor(red: 206/255, green: 77/255, blue: 69/255, alpha: 1)
        self.buttonGIDSignIn.setTitle("Getting started with Google", for: .normal)
        self.buttonGIDSignIn.setTitleColor(.white, for: .normal)
        self.view.addSubview(self.buttonGIDSignIn)
        self.buttonGIDSignIn.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.72)//260
            make.height.equalTo(self.screenFrameWidth * 0.11)//40
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(self.screenFrameWidth * 0.83)//298
        }
        self.buttonGIDSignIn.addTarget(self, action: #selector(self.tappedGIDSignInButton(btn:)), for: .touchUpInside)
        
        //loading
        self.viewLoadingBlur.backgroundColor = .white
        self.viewLoadingBlur.alpha = 0.7
        self.view.addSubview(self.viewLoadingBlur)
        self.viewLoadingBlur.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        
        let sizeLoading = CGSize(width: 30, height: 30)
        self.loading.frame.size = sizeLoading
        self.viewLoadingBlur.addSubview(self.loading)
        self.loading.snp.makeConstraints { (make) in
            make.center.equalTo(self.viewLoadingBlur)
        }
        self.loading.startAnimating()
        self.viewLoadingBlur.isHidden = true
    }
}
