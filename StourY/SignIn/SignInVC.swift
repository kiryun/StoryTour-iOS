//
//  SignInView.swift
//  StoryTour
//
//  Created by 김기현 on 28/08/2018.
//  Copyright © 2018 김기현. All rights reserved.
//
import UIKit
import SnapKit
import FBSDKCoreKit
import FBSDKLoginKit
import FacebookLogin
import NVActivityIndicatorView

//체크 리스트
//1. 로그인 이력이 있다면 or 로그인중 이라면 프로그레스 바


class SignInVC: UIViewController, GIDSignInUIDelegate{
    var screenFrameWidth = UIScreen.main.bounds.width
    
    //loading
    var viewLoadingBlur = UIView()
    var loading = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), type: .lineSpinFadeLoader, color: identityColor())
    
    //lazy var box = UIView()
    let buttonGIDSignIn = UIButton(type: .custom)
    
    @IBAction func selectedFBSDKLoginButton(_ sender: FBSDKLoginButton) {
//        if User.sharedUser.isHaveUserData {
            User.sharedUser.userActualState = 1
            if Reachability.isConnectedToNetwork(){
                
            }else{
                ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
            }
//        }
    }
    @IBOutlet weak var fbLoginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fbLoginButton.isHidden = true
        
        //ui
        self.setupView()
        
        //google sign in button
        GIDSignIn.sharedInstance().uiDelegate = self
        if Reachability.isConnectedToNetwork(){
            User.sharedUser.userActualState = 0
            
            //Attempts to sign in a previously authenticated user without interaction.
            //상호 작용없이 이전에 인증 된 사용자를 로그인하려고 시도
            //The delegate will be called at the end of this process indicating success or failure.
            //이 프로세스의 끝에서 성공 또는 실패를 나타내는 delegate가 호출
            GIDSignIn.sharedInstance().signInSilently()
            
            //fb 읽기 권한 받아오기
            fbLoginButton.readPermissions = ["public_profile","email"]//["publicProfile","email","publicProfile"]
            
            //if the user is already logged in
            if FBSDKAccessToken.current() != nil{ // logged in
                self.getFBUserData()
            }else{ // not logged in
                
            }
//            if let accessToken = FBSDKAccessToken.current(){
//                getFBUserData()
//            }else{
//
//            }
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
        
        
    }
    
    //when login button clicked
    @objc func loginButtonClicked() {
        print("SignInVC.loginButtonClicked")
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getFBUserData()
            }
        }
    }
    
    //function is fetching the user data
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            print("signIn fb")
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    User.sharedUser.signUpParam = result as! [String : AnyObject]
                    print("getFBUserData: ",User.sharedUser.signUpParam)
                    //                    self.dict = result as! [String : AnyObject]
                    //                    print(result!)
                    //                    print(self.dict)
//                    User.sharedUser.signUp()
//                    User.sharedUser.signIn()
                }
                else{
                    print("fbskGraphRequest error")
                }
            })
        }
    }
}

