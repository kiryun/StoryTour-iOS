//
//  GetLabelHeight.swift
//  StourY
//
//  Created by 김기현 on 06/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

//usage
//let height = item.yourText.customHeight(constraintedWidth: cell.textView.bounds.width, font: UIFont.systemFont(ofSize: 17, weight: UIFontWeightSemibold))
//cell.textViewHeightConstraint.constant = (height)
extension String{
    func getTextHeight(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame.height
    }
}

