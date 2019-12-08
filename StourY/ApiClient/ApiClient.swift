//
//  ApiClient.swift
//  StoryTour
//
//  Created by 김기현 on 2018. 7. 9..
//  Copyright © 2018년 김기현. All rights reserved.
//

import Foundation

//server에 호출하는 부분 static으로 바꾸자

class ApiClient
{
    private let alamofire: AlamofireClient = AlamofireClient()
    private let baseURL: String = "http://13.125.83.183:8080/storytour/api/"
    private var perfectURL: String = ""
    private var version: Int = 1
//    private var user = User.sharedUser
    public static let sharedApiClient: ApiClient = {
        let instance = ApiClient()
        
        return instance
    }()
    
    var reachabilityCheck = Reachability()
    
    
    //get
    //array
    //http://13.125.83.183:8080/storytour/api/1/user/attr/rec/dozens/1
    func getMainRecommandAttr(lat: Double, lon: Double, page: Int, completionHandler: @escaping (NSArray?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/attr/rec/dozens/\(User.sharedUser.language)"
        print(perfectURL)
        
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    //http://13.125.83.183:8080/storytour_test/api/1/user/attr/attraction/dozens/37.57674952730604/126.99137650430202/1/1
    func getPersonalRecommandAttr(lat: Double, lon: Double, page: Int, completionHandler: @escaping (NSArray?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/attr/attraction/dozens/\(lat)/\(lon)/\(User.sharedUser.language)/\(page)"
        print(perfectURL)
        
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    //http://13.125.83.183:8080/storytour_test/api/1/user/attr/tour/dozens/37.579108/126.990957/1/1
    func getTours(lat: Double, lon: Double, page: Int, completionHandler: @escaping (NSArray?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/attr/tour/dozens/\(lat)/\(lon)/\(User.sharedUser.language)/\(page)"
        print(perfectURL)
        
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    //http://13.125.83.183:8080/storytour_test/api/1/user/attr/restaurant/dozens/37.5841312339/126.9821869/1/1
    func getRestaurants(lat: Double, lon: Double, page: Int, completionHandler: @escaping (NSArray?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/attr/restaurant/dozens/\(lat)/\(lon)/\(User.sharedUser.language)/\(page)"
        print(perfectURL)
//        print("getRestaurants params: ", params)
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    //http://13.125.83.183:8080/storytour/api/1/user/attr/search/dozens/1/1?query=요리_경복궁&lat=37.530366_37.539884&lon=127.0549571_127.070469&category=
    func getSearchResultList(params: [String:Any], page: Int, completionHandler: @escaping (NSArray?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/attr/search/dozens/\(User.sharedUser.language)/\(page)"
        print(perfectURL)
        print("getSearchResultList params: ", params)
//        let emptyParams: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
        
    }
    
    //http://13.125.83.183:8080/storytour/api/1/user/attr/guide/dozens/1
    func getGuideList(completionHandler: @escaping (NSArray?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/attr/guide/dozens/\(User.sharedUser.language)"
        print(perfectURL)
//        print("getGuideList params: ", params)
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    //http://13.125.83.183:8080/storytour/api/1/user/attr/guide/list/8344/0
    func getAudioGuide(attractionIdx: Int, completionHandler: @escaping (NSArray?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/attr/guide/list/\(attractionIdx)/\(User.sharedUser.language)"
        print(perfectURL)
//        print("getAudioGuide params: ", params)
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    func getCartoonGuide(attractionIdx: Int, completionHandler: @escaping (NSArray?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/attr/cartoon/list/\(attractionIdx)/\(User.sharedUser.language)"
        print(perfectURL)
//        print("getCartoonGuide params: ", params)
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    //http://13.125.83.183:8080/storytour/api/1/user/like/list/1
    func getLikeList(completionHandler: @escaping (NSArray?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/like/list/\(User.sharedUser.language)"
        print(perfectURL)
//        print("getLikeList params: ", params)
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    //http://13.125.83.183:8080/storytour/api/1/user/visit/list/0
    func getVisitList(completionHandler: @escaping (NSArray?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/visit/list/\(User.sharedUser.language)"
        print(perfectURL)
//        print("getVisitList params: ", params)
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    // dictionary
    //http://13.125.83.183/storytour/api/1/user/attr/tour/detail/7919/1
    func getTourDetail(attractionIdx: Int, completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/attr/tour/detail/\(attractionIdx)/\(User.sharedUser.language)"
        print(perfectURL)
//        print("getTourDetail params: ", params)
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    //http://13.125.83.183:8080/storytour/api/1/user/attr/restaurant/detail/7878/1
    func getRestaurantDetail(attractionIdx: Int, completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/attr/restaurant/detail/\(attractionIdx)/\(User.sharedUser.language)"
        print(perfectURL)
//        print("getRestaurantDetail params: ", params)
        let params: [String:Any] = [:]
        alamofire.requestGet(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    //post
    //dictionary
    func postSignUp(params: [String:Any], completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/sign/up"
        print(perfectURL)
        print("postSignUp params: ", params)
        //let params: [String:Any] = [:]
        alamofire.requestUserPost(urlString: perfectURL,
                              paramArr: params,
                              completionHandler: completionHandler)
    }
    
    func postSignIn(params: [String:Any], completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/sign/in"
        print(perfectURL)
        print("postSignIn params: ", params)
        //let params: [String:Any] = [:]
        alamofire.requestUserPost(urlString: perfectURL,
                              paramArr: params,
                              completionHandler: completionHandler)
    }
    
    func postCheckForSignUp(params: [String:Any], completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/sign/isExistedAccount"
        print(perfectURL)
        print("postCheckForSignUp params: ", params)
        //let params: [String:Any] = [:]
        alamofire.requestUserPost(urlString: perfectURL,
                              paramArr: params,
                              completionHandler: completionHandler)
    }
    //http://13.125.83.183:8080/storytour/api/1/user/like
    func postLike(params: [String:Any], completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/like"
        print(perfectURL)
        print("postLike params: ", params)
        alamofire.requestPost(urlString: perfectURL,
                              paramArr: params,
                              completionHandler: completionHandler)
    }
    //http://13.125.83.183:8080/storytour/api/1/user/visit
    func postVisit(params: [String:Any], completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/visit"
        print(perfectURL)
        print("postVisit params: ", params)
        alamofire.requestPost(urlString: perfectURL,
                              paramArr: params,
                              completionHandler: completionHandler)
    }
    //http://13.125.83.183:8080/storytour/api/1/user/evaluate
    func postVisitScore(params: [String:Any], completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/evaluate"
        print(perfectURL)
        print("postVisitScore params: ", params)
        alamofire.requestPost(urlString: perfectURL,
                              paramArr: params,
                              completionHandler: completionHandler)
    }
    
    //del
    //http://13.125.83.183:8080/storytour/api/1/user/like/cancel
    func delLike(params: [String:Any], completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/like/cancel"
        print(perfectURL)
        print("delLike params: ", params)
        alamofire.requestDel(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    func delVisit(params: [String:Any], completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/visit/cancel"
        print(perfectURL)
        print("delVisit params: ", params)
        alamofire.requestDel(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
    ///api/{version}/user/sign/delete
    func delUser(params: [String:Any], completionHandler: @escaping (NSDictionary?, NSError?)-> ()){
        perfectURL = self.baseURL+"\(self.version)/user/sign/delete"
        print(perfectURL)
        print("delUser params: ", params)
        alamofire.requestDel(urlString: perfectURL,
                             paramArr: params,
                             completionHandler: completionHandler)
    }
    
}
