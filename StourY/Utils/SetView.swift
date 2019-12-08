//
//  ViewSetShadow.swift
//  StourY
//
//  Created by 김기현 on 14/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation


func viewSetShadow(view: UIView){
    view.layer.backgroundColor = UIColor.clear.cgColor
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
    view.layer.shadowOpacity = 0.23
    view.layer.shadowRadius = 10.0
    view.layer.masksToBounds = false
}

func viewSetRadius(view: UIView, radius: CGFloat, color: Bool){
    if color{
        view.layer.borderColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1).cgColor //185 108 117
        view.layer.borderWidth = 1.0
    }else{
        view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    }
    
    view.layer.cornerRadius = radius
    view.layer.masksToBounds = true
}

func identityColor() -> UIColor{
    return UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1)
}

func backgroundColor() -> UIColor{
    return UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1) // f7 -> 247 -> 0.97
}

func getThumanilImage(thumnailAddr: String) -> UIImage{
    let thumnailImage = NSURL(string: thumnailAddr)
    let data = NSData(contentsOf: thumnailImage as! URL)
    return UIImage(data: data! as Data)!
}
