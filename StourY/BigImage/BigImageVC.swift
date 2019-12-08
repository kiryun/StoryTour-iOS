//
//  BigImageVC.swift
//  StourY
//
//  Created by 김기현 on 08/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit

class BigImageVC: UIViewController {
    let screenFrameWidth = UIScreen.main.bounds.width
    
    var viewBigImage = UIView()
    var imageViewBigImage = UIImageView()
    
    
    //받아온 데이터
    var arrayBigImageList = Array<String>()
    var intArrayIdx = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    

}
