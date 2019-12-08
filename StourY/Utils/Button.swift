//
//  Button.swift
//  StourY
//
//  Created by 김기현 on 23/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension UIButton{
    private struct UserData{
        static var userData: Int = 0
    }
    var userData: Int{
        set(newData){
            UserData.userData = newData
        }
        get{
            return UserData.userData
        }
    }
}
