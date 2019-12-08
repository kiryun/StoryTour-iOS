//
//  PlayBarSetupView.swift
//  StourY
//
//  Created by 김기현 on 01/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension PlayBarVC{
    func setupView(){
        //        print(self.audioGuide!)
        
        //title
        self.titleLabel.text = self.audioGuide?.title
        self.titleLabel.textAlignment = .center
        self.view.addSubview(self.titleLabel)
        self.titleLabel.font = UIFont(name: self.titleLabel.font.fontName, size: 19)
        self.titleLabel.numberOfLines = 0
        self.titleLabel.sizeToFit()
        self.titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.screenFrameWidth * 0.05)//19/360
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(self.screenFrameWidth * 0.04)//16/360
        }
        
        //seekBar
        self.seekBar.setValue(0.0, animated: true)
        self.view.addSubview(self.seekBar)
        self.seekBar.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.83)//297/360
            make.height.equalTo(15)//잘안눌려서 크기 좀 늘림
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(self.screenFrameWidth * 0.03)//11.5/360
        }
        
        //currentTimeLabel
        self.currentTimeLabel.text = "0:00"
        self.currentTimeLabel.textColor = UIColor(red: 0.56, green: 0.56, blue: 0.56, alpha: 1)
        self.currentTimeLabel.textAlignment = .center
        self.view.addSubview(self.currentTimeLabel)
        self.currentTimeLabel.numberOfLines = 0
        self.currentTimeLabel.sizeToFit()
        self.currentTimeLabel.font = UIFont(name: self.currentTimeLabel.font.fontName, size: 8)
        self.currentTimeLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.07)//15/360 (=0.04)->안보여서 좀 더 늘렸음
            make.height.equalTo(self.screenFrameWidth * 0.02)//8/360
            make.top.equalTo(self.seekBar.snp.bottom).offset(self.screenFrameWidth * 0.03)//4.5/360 (=0.01)->안보여서 좀 더 늘렸음
            make.left.equalTo(self.seekBar)
        }
        
        //timeLengthLabel
        self.timeLengthLabel.text = "0:00"
        self.timeLengthLabel.textColor = UIColor(red: 0.56, green: 0.56, blue: 0.56, alpha: 1)
        self.timeLengthLabel.textAlignment = .center
        self.view.addSubview(self.timeLengthLabel)
        self.timeLengthLabel.numberOfLines = 0
        self.timeLengthLabel.sizeToFit()
        self.timeLengthLabel.font = UIFont(name: self.timeLengthLabel.font.fontName, size: 8)
        self.timeLengthLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.07)//15/360 (=0.04)->안보여서 좀 더 늘렸음
            make.height.equalTo(self.screenFrameWidth * 0.02)//8/360
            make.top.equalTo(self.seekBar.snp.bottom).offset(self.screenFrameWidth * 0.03)//4.5/360 (=0.01)->안보여서 좀 더 늘렸음
            make.right.equalTo(self.seekBar)
        }
        
        //playButton
        self.playButton.setImage(UIImage(named: "btn_start"), for: .normal)
        self.view.addSubview(self.playButton)
        self.playButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.screenFrameWidth * 0.07)//25/360
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.seekBar.snp.bottom).offset(self.screenFrameWidth * 0.01)
        }
        self.playButton.addTarget(self, action: #selector(self.onTouchPlayButton(sender:)), for: .touchUpInside)
        
        //collection view
        print("setupview: ",self.collectionView) // nil
        self.view.addSubview(self.collectionView)
//        self.collectionView.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        self.collectionView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.77)//(90+4+90+4+90)/360
            make.height.equalTo(self.screenFrameWidth * 0.51)//(90+4+90+4)/360
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.playButton.snp.bottom).offset(self.screenFrameWidth * 0.12)//44/360
        }
        
    }
}
