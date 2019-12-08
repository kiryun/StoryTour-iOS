//
//  TagsInView.swift
//  StourY
//
//  Created by 김기현 on 15/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

@IBDesignable class TagsInView: UIControl{
    var arrayTags = Array<UILabel>(){
        didSet{
            self.updateView()
        }
    }
    
    func updateView(){
        self.arrayTags.removeAll()
        for i in 0 ..< self.arrayTags.count{
//            self.arrayTags[i].textAlignment = .center
//            self.arrayTags[i].layer.borderWidth = 2.0
//            self.arrayTags[i].layer.borderColor = UIColor.black.cgColor
            self.addSubview(self.arrayTags[i])
            self.arrayTags[i].snp.makeConstraints { (make) in
                if i == 0{
                    make.left.equalTo(self).offset(15)
                    make.centerY.equalTo(self)
                }else{
                    make.left.equalTo(self.arrayTags[i-1].snp.right).offset(5)
                    make.centerY.equalTo(self)
                    if self.arrayTags[i-1].frame.origin.x + self.arrayTags[i-1].frame.size.width >= self.frame.width{
                        make.left.equalTo(self)
                    }
                }
            }
        }
    }
}

