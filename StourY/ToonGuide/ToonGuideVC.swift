//
//  ToonGuideVC.swift
//  StourY
//
//  Created by 김기현 on 04/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit

class ToonGuideVC: UIViewController {
    var screenFrameWidth = UIScreen.main.bounds.width
    
    //ui
    var navBar: UINavigationBar!
    @IBOutlet weak var viewPager: ViewPager!
    
    //받아온 데이터
    var toonGuideList = Array<String>()
//    {
//        didSet{
//            print("didSet")
//        }
//    }
    
//    var index = newTargetOffset / pageWidth
//    var nowCollectionIndex = Int(index)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.toonGuideList)
        
        self.setupNavBar()
        self.setupView()
        
        self.viewPager.dataSource = self
    }

}
