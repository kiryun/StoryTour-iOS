//
//  GetLanguageCode.swift
//  StourY
//
//  Created by 김기현 on 28/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

//https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes

import Foundation

func setLanguageCode(strCode: String){
    switch strCode {
    case "en":
        User.sharedUser.language = 0
    case "ko":
        User.sharedUser.language = 1
    default:
        User.sharedUser.language = 0
    }
}
