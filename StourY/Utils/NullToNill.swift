//
//  NullToNil.swift
//  StoryTour
//
//  Created by 김기현 on 2018. 7. 10..
//  Copyright © 2018년 김기현. All rights reserved.
//

import Foundation

func nullToNil(value: AnyObject?) -> AnyObject?{
    if value is NSNull{
        return nil
    }
    else{
        return value
    }
}
