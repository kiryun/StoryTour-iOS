//
//  ToonGuideViewPager.swift
//  StourY
//
//  Created by 김기현 on 09/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension ToonGuideVC: ViewPagerDataSource{
    func numberOfItems(viewPager: ViewPager) -> Int {
        return self.toonGuideList.count
    }
    
    func viewAtIndex(viewPager: ViewPager, index: Int, view: UIView?) -> UIView {
        var newView = view;
        var imgView: UIImageView?
        let baseURL = "http://13.125.83.183:8080/resources/guides/cartoon/"
        
        if(newView == nil){
            //            print("newView == nil")
            newView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:  self.view.frame.height))
            imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
            //            print(baseURL+self.toonGuideList[index])
            let url : NSString = baseURL+self.toonGuideList[index] as NSString
            let urlStr : NSString = url.addingPercentEscapes(using: String.Encoding.utf8.rawValue)! as NSString
            
            if Reachability.isConnectedToNetwork(){
                if let url = NSURL(string: urlStr as String){
                    print("url: ",url)
                    let data = NSData(contentsOf: url as URL)
                    imgView!.image = UIImage(data: data! as Data)
                    imgView!.contentMode = .scaleAspectFit
                }
            }else{
                ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
            }
            
            
            newView?.addSubview(imgView!)
        }else{
            imgView = newView?.viewWithTag(1) as? UIImageView
        }
        
        return newView!
    }
    
    
    
}
