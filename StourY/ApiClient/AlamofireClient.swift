//
//  AlamofireClient.swift
//  StoryTour
//
//  Created by 김기현 on 2018. 7. 9..
//  Copyright © 2018년 김기현. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireClient{
    fileprivate let queue = DispatchQueue(label: "requests.queue", qos: .utility)
    fileprivate let mainQueue = DispatchQueue.main
    init()
    {
        //print("AlamofireClient.init")
    }
    
    /*
     ////////////////////////////////////////
     user
     ////////////////////////////////////////
     */
    //return NSDictionary
    func requestUserPost(urlString: String, paramArr: [String:Any]? = nil,
                         completionHandler: @escaping (NSDictionary?, NSError?) -> ())
    {
        print("requestPost")
        let urlString = urlString
        print(paramArr!)
        Alamofire.request( //인터넷 연결을 확인해야함.
            urlString,
            method: .post,
            parameters: paramArr!,
            encoding: JSONEncoding.default,
            headers: ["Content-Type":"application/json"]
            )
            .responseJSON{
                response in
                switch response.result{
                case .success(let JSON):
                    completionHandler(JSON as? NSDictionary, nil)
                    print("response.statusCode: ",response.response?.statusCode as! Int) // 200이면 제대로 들어간거
                case .failure(let error):
                    completionHandler(nil, error as NSError)
                }
        }
    }
    
    /*
     ////////////////////////////////////////
     normal
     ////////////////////////////////////////
     */
    
    //return NSArray
    func requestGet(urlString: String, paramArr: [String:Any]? = nil,
                    completionHandler: @escaping (NSArray?, NSError?) -> ())
    {
        //print("requestGet")
        let urlString = urlString
        Alamofire.request( //인터넷 연결을 확인해야함.
            urlString,
            method: .get,
            parameters: paramArr,
            encoding: URLEncoding.default,
            headers: ["User-Idx":"\(User.sharedUser.userIdx)"]
            )
            .responseJSON{ //.responseJSON(queue: queue)
                response in
                switch response.result{
                case .success(let JSON):
                    //self.mainQueue.async {
                    completionHandler(JSON as? NSArray, nil)
                //}
                case .failure(let error):
                    //self.mainQueue.async {
                    completionHandler(nil, error as NSError)
                    //}
                }
        }
    }
    
    //return NSDictionary
    func requestGet(urlString: String, paramArr: [String:Any]? = nil,
                    completionHandler: @escaping (NSDictionary?, NSError?) -> ())
    {
        //print("requestGet")
        let urlString = urlString
        Alamofire.request( //인터넷 연결을 확인해야함.
            urlString,
            method: .get,
            parameters: paramArr,
            encoding: URLEncoding.default,
            headers: ["User-Idx":"\(User.sharedUser.userIdx)"]
            )
            .responseJSON{ //.responseJSON(queue: queue)
                response in
                switch response.result{
                case .success(let JSON):
                    //self.mainQueue.async {
                    completionHandler(JSON as? NSDictionary, nil)
                    
                //}
                case .failure(let error):
                    //self.mainQueue.async {
                    completionHandler(nil, error as NSError)
                    //}
                }
        }
    }
    
    //NSArray
    func requestPost(urlString: String, paramArr: [String:Any]? = nil,
                     completionHandler: @escaping (NSArray?, NSError?) -> ())
    {
        print("requestPost")
        let urlString = urlString
//        print(paramArr!)
        Alamofire.request( //인터넷 연결을 확인해야함.
            urlString,
            method: .post,
            parameters: paramArr!,
            encoding: JSONEncoding.default,
            headers: ["User-Idx":"\(User.sharedUser.userIdx)"]
            )
            .responseJSON{
                response in
                switch response.result{
                case .success(let JSON):
                    completionHandler(JSON as? NSArray, nil)
                    print("response.statusCode: ",response.response?.statusCode as! Int) // 200이면 제대로 들어간거
                case .failure(let error):
                    completionHandler(nil, error as NSError)
                }
        }
    }
    
    //NSDictionary
    func requestPost(urlString: String, paramArr: [String:Any]? = nil,
                     completionHandler: @escaping (NSDictionary?, NSError?) -> ())
    {
        print("requestPost")
        let urlString = urlString
//        print(paramArr!)
        Alamofire.request( //인터넷 연결을 확인해야함.
            urlString,
            method: .post,
            parameters: paramArr!,
            encoding: JSONEncoding.default,
            headers: ["User-Idx":"\(User.sharedUser.userIdx)"]
            )
            .responseJSON{
                response in
                switch response.result{
                case .success(let JSON):
                    completionHandler(JSON as? NSDictionary, nil)
                    print("response.statusCode: ",response.response?.statusCode as! Int) // 200이면 제대로 들어간거
                case .failure(let error):
                    completionHandler(nil, error as NSError)
                }
        }
    }
    
    //NSDictionary
    func requestDel(urlString: String, paramArr: [String:Any]? = nil,
                    completionHandler: @escaping (NSDictionary?, NSError?) -> ()){
        print("requestDel")
        let urlString = urlString
//        print(paramArr!)
        var headers: Dictionary<String,String> = Dictionary()
        headers["Content-Type"] = "application/json"
        headers["User-Idx"] = "\(User.sharedUser.userIdx)"
        Alamofire.request(urlString,
                          method: .delete,
                          parameters: paramArr!,
                          encoding: JSONEncoding.default,
                          headers: headers)
            .responseJSON { (response) in
                switch response.result{
                case .success(let JSON):
                    completionHandler(JSON as? NSDictionary, nil)
                    print("response.statusCode: ",response.response?.statusCode as! Int)
                case .failure(let error):
                    completionHandler(nil, error as NSError)
                }
        }
    }
    
    
    
}
