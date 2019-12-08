//
//  GetExternalData.swift
//  StourY
//
//  Created by 김기현 on 27/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

//usage
//cell.imgView.image = getImagesFromURL(strURL: self.nowTableList[indexPath.section].thumnailAddr!)

import Foundation

func getImageFromURL(strURL: String) -> UIImage{
    if let url = NSURL(string: strURL){
//        print("getImagesFromURL.url",url)
        if let data = NSData(contentsOf: url as URL){
            return UIImage(data: data as Data)!
        }
    }
    return UIImage()
}
