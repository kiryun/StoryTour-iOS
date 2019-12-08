//
//  SignInAction.swift
//  StourY
//
//  Created by 김기현 on 28/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension SignInVC{
    
    @objc func tappedGIDSignInButton(btn: UIButton){
        print("SignInVC.tappedGIDSignInButton")
//        if !User.sharedUser.isHaveUserData {
        User.sharedUser.userActualState = 1
        if Reachability.isConnectedToNetwork(){
            print("ok")
            self.viewLoadingBlur.isHidden = false
            GIDSignIn.sharedInstance().signIn()
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
//        }
    }

    func nextView(_ animated: Bool) {
        print("nextView")
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
        //        self.present(vc, animated: true, completion: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
        self.present(vc, animated: true, completion: nil)
    }
}
