//
//  CustomNavigationBar.swift
//  StoryTour
//
//  Created by 김기현 on 13/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

class CustomNavigationBar: UINavigationBar{
    var screenFrameWidth = UIScreen.main.bounds.width
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: screenFrameWidth, height: screenFrameWidth * 0.21) // 75/360
    }
}
