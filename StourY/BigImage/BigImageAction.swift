//
//  BigImageAction.swift
//  StourY
//
//  Created by 김기현 on 08/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension BigImageVC{
    @objc func tappedDownButton(btn: UIButton){
        UIView.animate(withDuration: 0.5) {
            print("BigImageVC.tappedDownButton")
//            self.viewBigImage.bounds.origin.y = self.view.bounds.height
            self.dismiss(animated: true, completion: nil)
        }
    }
}
