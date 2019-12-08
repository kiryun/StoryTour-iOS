//
//  MainTabbarController.swift
//  StoryTour
//
//  Created by 김기현 on 01/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit

//1. 아이콘
//2. 커스텀 탭바( 색, 높이 )

class MainTabbarController: UITabBarController, UITabBarControllerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.tabBar.frame.size.height = self.view.frame.size.width * 0.13 //47dp / 360dp
        //self.tabBar.tintColor = .lightGray
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let home: HomeVC = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        let map: MapVC = mainStoryBoard.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        let guide: GuideVC = mainStoryBoard.instantiateViewController(withIdentifier: "GuideVC") as! GuideVC
        let myPage: MyPageVC = mainStoryBoard.instantiateViewController(withIdentifier: "MyPageVC") as! MyPageVC
        
        //        let homeTabBarItem = UITabBarItem(image: , selectedImage: <#T##UIImage?#>)
        //        let mapTabBarItem = UITabBarItem(title: <#T##String?#>, image: <#T##UIImage?#>, tag: <#T##Int#>)
        
        var strHome = "Home"
        var strMap = "Map"
        var strGuide = "Guide"
        var strMyPage = "My page"
        switch User.sharedUser.language {
        case 0:
            strHome = "Home"
            strMap = "Map"
            strGuide = "Guide"
            strMyPage = "My page"
        case 1:
            strHome = "홈"
            strMap = "지도"
            strGuide = "가이드"
            strMyPage = "마이페이지"
        default:
            strHome = "Home"
            strMap = "Map"
            strGuide = "Guide"
            strMyPage = "My page"
        }
        home.tabBarItem = UITabBarItem(title: strHome, image: UIImage(named: "icon_home_off"), tag: 0)
        map.tabBarItem = UITabBarItem(title: strMap, image: UIImage(named: "icon_map_on"), tag: 1)
        guide.tabBarItem = UITabBarItem(title: strGuide, image: UIImage(named: "icon_guide_off"), tag: 2)
        myPage.tabBarItem = UITabBarItem(title: strMyPage, image: UIImage(named: "icon_mypage_off"), tag: 3)
        
//        home.tabBarItem.image?.draw(in: CGRect(x: 0, y: 0, width: 10, height: 10))
//        home.tabBarItem.image?.renderingMode = .alwaysOriginal// = CGSize(width: 30, height: 30)
//        home.tabBarItem.selectedImage?.renderingMode =
        let controllers = [home, map, guide, myPage]  //array of the root view controllers displayed by the tab bar interface
        
        self.viewControllers = controllers
        //self.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
    }
    
    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //print("Should select viewController: \(viewController.title) ?")
        return true;
    }
}
