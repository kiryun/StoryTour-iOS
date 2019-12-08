//
//  GetLabelHeight.swift
//  StourY
//
//  Created by 김기현 on 06/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

func getLabelHeight(text: String, width: CGFloat, font: UIFont) -> CGFloat {
    let lbl = UILabel(frame: .zero)
    lbl.frame.size.width = width
    lbl.font = font
    lbl.numberOfLines = 0
    lbl.text = text
    lbl.sizeToFit()
    
    return lbl.frame.size.height
}
