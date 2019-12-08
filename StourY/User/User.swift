//
//  Users.swift
//  StoryTour
//
//  Created by 김기현 on 2018. 8. 4..
//  Copyright © 2018년 김기현. All rights reserved.
//

import Foundation
import GoogleMaps

//singleton
class User{
    //user기본 정보
    public var lat: Double = 0.0
    public var lon: Double = 0.0
//    public var boolLocationFlag = false // lat과 lon이 세팅이 되었는지 안되었는지 확인 해주는 flag
    
    //google에서 받아올수있는 자료
    public var id: String = ""
    public var userID: String = ""
    public var idToken: String = ""
    public var fullName: String = "" // server -> name
    public var givenName: String = ""
    public var familyName: String = ""
    public var email: String = "" // server -> id
    
    public var snsIdx: Int = 0// server -> snsIdx
    public var age: Int = 20
    public var mindAge: Int = 20
    public var isVegeterian: Bool = false
    public var nationIdx: String = ""
    public var religionIdx: Int = 0
    public var hobyList: Array<Int> = []
    public var interestList: Array<Int> = []
    
    //로그인 후 받아 온 정보
    public var userIdx: Int = -1 // 만약 userIdx가 -1이면 제대로 회원가입이 안되었거나 로그인에 문제가 있던거임.
    public var profileImgAddr: String = ""
    
    //    public var likeList: Array<Int> = [] //딕셔너리로 해야하지 않나? 유일성을 위해서
    //    public var visitList: Array<Int> = []
    public var likeList = Array<LikeVisitForm>()
    public var visitList = Array<LikeVisitForm>()
    
//    public var isHaveUserData = false
    //false: user data 없음
    //true: user data 있음(한번 로그인한적 있음)
    
    //왜 만들었는지 다시한번 생각해볼 필요가 있는데
    //로그아웃, 회원탈퇴 과정에서 버튼을 누를 수 있음
    public var userActualState = 0
    // 0: 아무런 행동을 취하지 않았을 때
    // 1: 로그인 버튼을 눌렀을 때
    // 2: 로그 아웃 버튼을 눌렀을 때
    // 3: 회원 탈퇴 버튼을 눌렀을 때
    
    public var language = 1
    // 0: en
    // 1: kr
    
    //homevc에서 처음 업데이트 되는건지 확인
//    public var boolHomeVCUpdated = false
    public var boolHomeVCLocationUpdated = false // home map 에서 위치정보 업데이트 되었는지 확인
    //서버에 넘겨줄 데이터
    var signUpParam: Dictionary<String,Any> = Dictionary()
    var signInParam: Dictionary<String,Any> = Dictionary()
    var searchForUserData: Dictionary<String, Any> = Dictionary()
    var signDelParam: Dictionary<String, Any> = Dictionary()
    
    func setUserInfomation(){
        print("User.setUserInfomation")
        //회원 정보 runTime 저장
        //print("print: ", userInstance.email)

//        {
//            "age": 0,
//            "countryISO": 0,
//            "gender": 0,
//            "id": "string",
//            "idx": 0,
//            "mindAge": 0,
//            "name": "string",
//            "nationCode": "string",
//            "nationIdx": 0,
//            "passwd": "string",
//            "profileImgAddr": "string",
//            "snsIdx": 0
//        }
//        {
//            "age": 0,
//            "countryISO": 0,
//            "gender": 0,
//            "id": "dummyKihyun1205@gmail.com",
//            "idx": 0,
//            "mindAge": 0,
//            "name": "김기현",
//            "nationCode": "",
//            "nationIdx": 0,
//            "passwd": "4dummyKihyun1205@gmail.com4",
//            "profileImgAddr": "",
//            "snsIdx": 4
//        }
        signUpParam["age"] = age
        signUpParam["countryISO"] = 0
        signUpParam["gender"] = 0
        signUpParam["id"] = email
//        signUpParam["idx"] = 0
        signUpParam["mindAge"] = 0
        signUpParam["name"] = fullName
        signUpParam["nationCode"] = ""
        signUpParam["nationIdx"] = nationIdx
        signUpParam["passwd"] = "\(snsIdx)"+email+"\(snsIdx)"
        signUpParam["profileImgAddr"] = ""
        signUpParam["snsIdx"] = snsIdx
//        print(signUpParam)
        
//        signUpParam["id"] = email
//        signUpParam["name"] = fullName
//        signUpParam["age"] = age
//        signUpParam["mindAge"] = mindAge
//        signUpParam["isVegeterian"] = isVegeterian
//        signUpParam["snsIdx"] = snsIdx
//        signUpParam["nationIdx"] = nationIdx
//        signUpParam["religionIdx"] = religionIdx
//        signUpParam["hobyList"] = hobyList
//        signUpParam["interestList"] = interestList
        
        
        //search for user data
        searchForUserData["id"] = email
        searchForUserData["snsIdx"] = snsIdx
        
        //signInParam init
        signInParam["id"] = email
        signInParam["snsIdx"] = snsIdx
        signInParam["passwd"] = "\(snsIdx)"+email+"\(snsIdx)"
        
        //google login 성공 하면
//        User.sharedUser.isHaveUserData = true
        
//        print(searchForUserData["id"])
//        print(searchForUserData["snsIdx"])
        
//        switch userActualState{ //로그아웃 했다가 다시 로그인 할 경우?어쩔거임
//        case 0:
//            print("call checkForSignUp")
//            self.checkForSignUp()//버튼 누르지 않았을 때는 회원가입 진행하면 안됨
//        case 1:
//            print("call signUpServer")
//            self.signUp()
//        default:
//            break
//        }
        self.checkForSignUp()
        
//        let locationManager = CLLocationManager()
//        
//        //위치 정보 세팅
//        self.lat = (locationManager.location?.coordinate.latitude)!
//        self.lon = (locationManager.location?.coordinate.longitude)!
    }
    
    //회원가입 여부 확인
    func checkForSignUp(){
        ApiClient.sharedApiClient.postCheckForSignUp(params: searchForUserData) { (response, error) in
            if error == nil{
                print("check for signUp response: ", response!)
                print("search for user data")
                
                if response?.object(forKey: "code") as! Int == 1{ //회원 가입 되어있다면
                    print("sign up completed user")
                    self.signIn()
                    let signVC = UIApplication.shared.keyWindow?.rootViewController as! SignInVC
                    signVC.viewLoadingBlur.isHidden = false
                }else{//회원가입이 되어있지 않다면
                    self.signUp()
                    
                }
            }else{
                print("check for sign up error!")
            }
        }
    }
    
    //로그인
    func signIn(){
        ApiClient.sharedApiClient.postSignIn(params: signInParam) { (response, error) in
            if error == nil{
                print("signIn response: ", response!)
                self.userIdx = response?.object(forKey: "userIdx") as! Int
                
                //성공적으로 로그인 했다면 회원탈퇴 dictionary 만든다.
                let pId = response?.object(forKey: "id") as! String
                let pIdx = response?.object(forKey: "userIdx") as! Int
                let pPasswd = "\(response?.object(forKey: "snsIdx") as! Int)\(response?.object(forKey: "id") as! String)\(response?.object(forKey: "snsIdx") as! Int)"
                let pSnsIdx = response?.object(forKey: "snsIdx") as! Int
                self.createSignDelete(pId: pId, pIdx: pIdx, pPasswd: pPasswd, pSnsIdx: pSnsIdx)
                
                //like list 받아온다.
                ApiClient.sharedApiClient.getLikeList(completionHandler: { (response, error) in
                    if error == nil{
                        print("success get likeList")
                        
                        setResponseData(responseObject: response, list: &self.likeList)
                        //                        for temp in response!{
                        //                            let tempDict = temp as! NSDictionary
                        //
                        //                            self.likeList.append(tempDict.object(forKey: "idx") as! Int)
                        //                        }
                        
//                        print(self.likeList)
                    }else{
                        print("likeList error!", error!)
                    }
                })
                
                ApiClient.sharedApiClient.getVisitList(completionHandler: { (response, error) in
                    if error == nil{
                        print("success get visitList")
                        
                        setResponseData(responseObject: response, list: &self.visitList)
                        //                        for temp in response!{
                        //                            let tempDict = temp as! NSDictionary
                        //                            self.visitList.append(tempDict.object(forKey: "idx") as! Int)
                        //                        }
                        
//                        print(self.visitList)
                    }else{
                        print("visitList error!", error!)
                    }
                })
                //로그인 완료 후 화면 전환
                let signVC = UIApplication.shared.keyWindow?.rootViewController as! SignInVC
                signVC.nextView(true)
                
                print("hello", User.sharedUser.email)
            } else{
                print("sign in error!")
            }
        }
    }
    
    //회원 가입
    func signUp(){
        
        ApiClient.sharedApiClient.postSignUp(params: signUpParam) { (response, error) in
            if error == nil{
                print("signUp response: ", response!)
                
                //만약 성공적으로 회원가입 했다면
                if response?.object(forKey: "code") as! Int == 1{
                    print("successd sign up")
                    //카드 선택 후
                    
                    //바로 로그인
                    self.signIn()
                }else{
                    print("failed sign up")
                }
            }else{
                print("sign up response error!")
            }
        }
    }
    
    //회원탈퇴 dictionary 생성
    func createSignDelete(pId: String, pIdx: Int, pPasswd: String, pSnsIdx: Int){
        //                "id": "string",
        //                "idx": 0,
        //                "passwd": "string",
        //                "snsIdx": 0
        self.signDelParam["id"] = pId
        self.signDelParam["idx"] = pIdx
        self.signDelParam["passwd"] = pPasswd
        self.signDelParam["snsIdx"] = pSnsIdx
    }
    
    //회원 탈퇴
    func signDelete(){
        ApiClient.sharedApiClient.delUser(params: self.signDelParam) { (res, err) in
            if err == nil{
                print("sign del response: ", res!)
                
                if res?.object(forKey: "code") as! Int == 1{
                    print("successed sign del")
                    exit(0)
                }else{
                    print("failed sign del")
                }
                
            }else{
                print("sign del response error!")
            }
        }
    }
    
    public static let sharedUser: User = {
        let instance = User()
        
        return instance
    }()
}
