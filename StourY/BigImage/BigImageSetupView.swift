//
//  BigImageSetupView.swift
//  StourY
//
//  Created by 김기현 on 08/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension BigImageVC{
    func setupView(){
        //big image
        self.viewBigImage.backgroundColor = .black
//        self.viewBigImage.bounds = CGRect(x: 0, y: self.view.bounds.height, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(self.viewBigImage)
        self.viewBigImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.view)
            make.top.bottom.left.right.equalTo(self.view)
        }
        
        //
        self.viewBigImage.addSubview(self.imageViewBigImage)
        self.imageViewBigImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.viewBigImage)
            make.center.equalTo(self.viewBigImage)
        }
        self.imageViewBigImage.contentMode = .scaleAspectFit
        
        //down button
        let buttonDown = UIButton(type: .custom)
        buttonDown.setImage(UIImage(named: "btn_down_white"), for: .normal)
        self.viewBigImage.addSubview(buttonDown)
        buttonDown.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.05)//18/360
            make.height.equalTo(self.screenFrameWidth * 0.03)//10/360
            make.top.equalTo(self.viewBigImage).offset(self.screenFrameWidth * 0.09)//30/360
            make.left.equalTo(self.viewBigImage).offset(self.screenFrameWidth * 0.04)//15/360
        }
        buttonDown.addTarget(self, action: #selector(self.tappedDownButton(btn:)), for: .touchUpInside)
        
        let baseURL = "http://13.125.83.183:8080/resources/guides/voice/img/"
        if let url = NSURL(string: baseURL+self.arrayBigImageList[self.intArrayIdx]+".jpg"){
            print(baseURL+self.arrayBigImageList[self.intArrayIdx]+".jpg")
            let data = NSData(contentsOf: url as URL)
            self.imageViewBigImage.image = UIImage(data: data! as Data)
        }
//        self.viewBigImage.bounds.origin.y = 0
    }
    
}
