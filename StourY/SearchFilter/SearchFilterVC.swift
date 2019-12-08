//
//  SearchFilterVC.swift
//  StourY
//
//  Created by 김기현 on 17/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit

class SearchFilterVC: UIViewController {
    var screenFrameWidth = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        
    }
    
    func setupView()
    {
        self.view.backgroundColor = .black
        self.view.alpha = 0.4
        
        let viewFilterView = UIView()
        viewFilterView.backgroundColor = .white
        viewSetRadius(view: viewFilterView, radius: 10.0, color: false)
        self.view.addSubview(viewFilterView)
        viewFilterView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth)
            make.height.equalTo(self.view.frame.height * 0.65) // 419/640
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }

}
