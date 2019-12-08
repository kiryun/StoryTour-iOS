//
//  MyPageSettingAction.swift
//  StourY
//
//  Created by 김기현 on 26/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
//import GoogleSignIn

extension MyPageSettingVC{
    
    @objc func tappedBack(btn: UIButton){
        print("MyPageSettingVC.tappedBack")
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func tappedLogOut(gestrue: UITapGestureRecognizer){
        print("MyPageSettingVC.tappedLogOut")
        self.intClickStatus = 0
        //밑에부분 정말 로그아웃하시겠습니까? 하고 3초후에 코드 실행
        switch User.sharedUser.language {
        case 0:
            self.labelTitle.text = "Log out"
        case 1:
            self.labelTitle.text = "로그아웃"
        default:
            self.labelTitle.text = "Log out"
        }
        
        switch User.sharedUser.language {
        case 0:
            self.labelSummary.text = "Are you sure?\nWell... it will not a bad thing,\nbut it will be hassle to log in again.\nif you click \"OK\", the app will be close."
        case 1:
            self.labelSummary.text = "정말 로그아웃 하시겠습니까?\n뭐... 별일 아니지만,\n다시 로그인하기 귀찮을 겁니다.\n\"확인\"을 누르시면 어플은 종료됩니다."
        default:
            self.labelSummary.text = "Are you sure?\nWell... it will not a bad thing,\nbut it will be hassle to log in again.\nif you click \"OK\", the app will be close."
        }
        
        self.viewPopUpFilter.isHidden = false
        self.viewPopUp.isHidden = false
    }
    
    func tappedSignOut(){
        print("MyPageSettingVC.tappedSignOut")
        self.intClickStatus = 1
        //회원 탈퇴 request보낸 후 성공하면
        //밑에부분 정말 회원탈퇴하시겠습니까? 하고 3초후에 코드 실행
        switch User.sharedUser.language {
        case 0:
            self.labelTitle.text = "Sign out"
        case 1:
            self.labelTitle.text = "회원탈퇴"
        default:
            self.labelTitle.text = "Sign out"
        }
        
        switch User.sharedUser.language {
        case 0:
            self.labelSummary.text = "Are you sure?\nYou will lose all your data when you Sign out.\nif you click \"OK\", the app will be close."
        case 1:
            self.labelSummary.text = "정말 회원을 탈퇴하시겠습니까?\n탈퇴하시면 모든 데이터가 사라집니다.\n\"확인\"을 누르시면 어플은 종료됩니다."
        default:
            self.labelSummary.text = "Are you sure?\nYou will lose all your data when you Sign out.\nif you click \"OK\", the app will be close."//d in 2 seconds
        }
        
        self.viewPopUpFilter.isHidden = false
        self.viewPopUp.isHidden = false
    }
    
    @objc func tappedLeft(btn: UIButton){
        print("MyPageVC.tappedLeft")
        if intClickStatus == 0{//회원탈퇴
            self.logOut()
        }else{//로그아웃
            self.signOut()
        }
    }
    
    @objc func tappedRight(btn: UIButton){
        print("MyPageVC.tappedRight")
        self.viewPopUpFilter.isHidden = true
        self.viewPopUp.isHidden = true
    }
    
    func logOut(){
        GIDSignIn.sharedInstance()?.signOut()
        GIDSignIn.sharedInstance()?.disconnect()
        exit(0)
        
    }
    
    func signOut(){
        GIDSignIn.sharedInstance()?.signOut()
        GIDSignIn.sharedInstance()?.disconnect()
        
        //            {
        //                "id": "string",
        //                "idx": 0,
        //                "passwd": "string",
        //                "snsIdx": 0
        //        }
        User.sharedUser.signDelete()
    }
    
}
