//
//  AppDelegate.swift
//  StoryTour
//
//  Created by 김기현 on 28/08/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import GoogleMaps
import GoogleSignIn
import FBSDKCoreKit

let googleMapApiKey = "AIzaSyAhSxCgPMrjn9vL62hkq7tPc7dc3EtLXnM"
let clientID = "181614590309-o42vb4bbu38q2hfqe6ouv2lvine5ul10.apps.googleusercontent.com"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //user정보에 대한 singleton
    var userInstance = User.sharedUser
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //google map
        GMSServices.provideAPIKey(googleMapApiKey)
        
        //google sign in
        GIDSignIn.sharedInstance().clientID = clientID
        GIDSignIn.sharedInstance().delegate = self
        
        //facebook sign in
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //language code
        let strCurrentLanguage = Locale.preferredLanguages[0].split(separator: "-")[0]
        print(strCurrentLanguage)
        setLanguageCode(strCode: String(strCurrentLanguage))
        
        
        
        return true
    }
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let gSignHandled = GIDSignIn.sharedInstance().handle(url,
                                                             sourceApplication: sourceApplication,
                                                             annotation: annotation)
        
        //        print("application signin handle")
        let fbSignhandled = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        
        return gSignHandled || fbSignhandled
        
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        
        let gSignHandled = GIDSignIn.sharedInstance().handle(url,
                                                             sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                             annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        print("application signin handle for ios9.0 later")
        let fbSignhandled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        return gSignHandled || fbSignhandled
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

//google sign in
extension AppDelegate: GIDSignInDelegate{
    
    //google sign in button을 누르면 호출되는 함수 또는 signInVC가 로드될때 호출됨. // 무슨 뜻이냐 하면 로그인 할 때 호출됨(google signIn은 자동로그인 인거 같음)
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {//로그인 실패
            print("\(error.localizedDescription)")
            // [START_EXCLUDE silent]
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: "ToggleAuthUINotification"), object: nil, userInfo: nil)
            // [END_EXCLUDE]
        } else { //로그인 성공
            print("sign in google")
            //이 부분 로그인 할 때 비동기 인데 안꼬일까? 회원가입 -> set유저 순이 아닌 set유저(아무것도 아닌 값이 user에 들어가고) -> 회원가입 순으로 되지 않을 까 걱정
            //profile init
            userInstance.id = user.userID
            userInstance.idToken = user.authentication.idToken
            userInstance.fullName = user.profile.name// server-> name
            userInstance.givenName = user.profile.givenName//
            userInstance.familyName = user.profile.familyName//
            userInstance.email = user.profile.email // server-> id // 여기 구글 부분 빼버리자
            userInstance.snsIdx = 4 // server-> snsIdx
            User.sharedUser.setUserInfomation()
            
            // [START_EXCLUDE]
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: "ToggleAuthUINotification"),
                object: nil,
                userInfo: ["statusText": "Signed in user:\n\(self.userInstance.fullName)"])
            // [END_EXCLUDE]
        }
    }
    
    //로그아웃 했을 경우 호출 됨
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        print("user disconnects from google")
        // Perform any operations when the user disconnects from app here.
        // [START_EXCLUDE]
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: "ToggleAuthUINotification"),
            object: nil,
            userInfo: ["statusText": "User has disconnected."])
        // [END_EXCLUDE]
//        User.sharedUser.isHaveUserData = false
//        //app restart
//        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInVC")//UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateViewController(withIdentifier: "SplashVC")
//        let navCtrl = UINavigationController(rootViewController: viewController)
//
//        guard
//            let window = UIApplication.shared.keyWindow,
//            let rootViewController = window.rootViewController
//            else {
//                return
//        }
//
//        navCtrl.view.frame = rootViewController.view.frame
//        navCtrl.view.layoutIfNeeded()
//
//        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
//            window.rootViewController = navCtrl
//        })
    }

}

extension UIApplication{
    var statusBarView: UIView?{
        return value(forKey: "statusBar") as? UIView
    }
}
