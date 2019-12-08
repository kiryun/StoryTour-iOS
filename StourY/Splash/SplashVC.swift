//
//  SplashVC.swift
//  StourY
//
//  Created by 김기현 on 22/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    var screenFrameWidth = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("splashVC")
        // Do any additional setup after loading the view.
        let imgView = UIImageView()
        imgView.image = UIImage(named: "stoury")
        self.view.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.37)//134/360
            make.height.equalTo(self.screenFrameWidth * 0.13)//45
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(self.screenFrameWidth * 0.42)//150
        }
    }

}
