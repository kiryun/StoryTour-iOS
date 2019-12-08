//
//  Array.swift
//  StourY
//
//  Created by 김기현 on 22/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

//usage
//var myArray = ["cat", "barbecue", "pancake", "frog"]
//let objectToRemove = "cat"
//
//myArray.remove(object: objectToRemove) // ["barbecue", "pancake", "frog"]

import Foundation

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}
