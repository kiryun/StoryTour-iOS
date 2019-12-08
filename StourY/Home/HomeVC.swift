//  HomeVC5.swift
//  StoryTour
//
//  Created by 김기현 on 01/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import SnapKit
import NVActivityIndicatorView // https://github.com/ninjaprox/NVActivityIndicatorView
import GoogleMaps

//1. tags[i]가 화면 넘어 갈 때 문제점
//3. 네비게이션 바에 현재 위치 select
//4. recommnadView 끝까지 왔을 때 reloadData() 만들어야 함
//5. collectionCell, tableCell 눌렀을 때 발생 되는 이벤트 정의( 새로운 화면 전환 )
//6. cell.imgView.image = UIImage(data: data! as Data) // 너무 빨리 내리면 nil에러 뜸 왜그럴까 -> tableView에 있음
//7. tableViewCell 로드할 때 렉걸림 심하게 걸림
//8. searchBar view로 만들고 addGestureRecognize 추가해
//9. lat이랑 lon user.shared에서 받아와 
//10. 위치 설정 하고 나면 버튼 title이 안바뀜

class HomeVC: UIViewController {
    var screenFrameWidth = UIScreen.main.bounds.width
    //navigaitonBar
    var navBar: UINavigationBar!
    var naviBarSegmentctrl: NavigationSegmentController!
    var visibleNaviBar = true
    
    //loading bar
    var loadingTableView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0),type: .lineSpinFadeLoader, color: identityColor())
    var loadingCollectionView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0),type: .lineSpinFadeLoader, color: identityColor())
    
    //topView
    //let topView = UIView()
    @IBOutlet weak var topView: UIView!
    
    //titleView
    let titleView = UIImageView()
    
    //searchBarView
    let searchBarShadow = UIView()
    let searchBarView = UIView()
    let searchBar = UIButton()
    
    //recommandViewGuardLine
    let recommandViewGuardLine = UIView()
    //recommandView in recommandViewGuardLine
    @IBOutlet weak var collectionView: UICollectionView!
    
    //viewSegmentCtrl
    var segmentView =  UIView()
    var viewSegmentCtrl = CustomSegmentControl()
    
    //tableView
    @IBOutlet weak var tableView: UITableView!
//    var likeBtnFlag = false
    var nowSelectedTable = -1
    
    var resSuccess: Bool = false
    
    //main 추천 관련
    var arrayMainRecommand = Array<AroundForm>()
    var intMainRecommandPageCnt: Int = 1
    
    //2차원 배열인 이유는 page별로 저장하기 위함
    //var aroundMainList: Array<Array<AroundForm>> = Array()
    var nowTableList: Array<AroundForm> = Array()
    var arrayNextTablePageCnt = [0, 0, 0, 0]//다음 page의 cell 갯수
    var arrayTableImageList = Array<UIImage>() //image를 저장할 배열
    var arrayTableTourImageList = Array<UIImage>()
    var arrayTableRestaurantImageList = Array<UIImage>()
    
    var arrayCollectionImageList = Array<UIImage>()
    
    //personalRecommandList
    var recommandList: Array<AroundForm> = Array()
    var mainTourList: Array<AroundForm> = Array()
    var mainRestaurantList: Array<AroundForm> = Array()
    var recommandPageCnt: Int = 1
    var tourPageCnt: Int = 1
    var restaurantPageCnt: Int = 1
    var lat = 37.579108
    var lon = 126.990957
    
    let locationManager = CLLocationManager()
    var boolViewDidLoad = false
//    var boolHomeVCUpdated = false // 처음 시작할 때만 location값 받아 올 수 있도록 하기
    
    override func viewDidLoad() {
        print("HomeVC.viewDidLoad")
        super.viewDidLoad()
        
        self.boolViewDidLoad = true
        
        locationManager.delegate = self
        
        self.initView()
        self.initNavigationBar()
        UIApplication.shared.statusBarView?.backgroundColor = .clear
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none // tableView 선 제거
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false // scroll bar 제거
        
        
        locationManager.requestWhenInUseAuthorization()//위치정보 권한 요청
        locationManager.startUpdatingLocation()
        
//        //location set
//
//        self.lat = User.sharedUser.lat
//        self.lon = User.sharedUser.lon
//        //        print("lat: ",self.lat)
//        //        print("lon: ",self.lon)
//
//        self.getAtrr()
//        self.getMainRecommand()
        
        
        
        
    }
    
}
extension HomeVC: CLLocationManagerDelegate{
    //location 권한이 바뀌었다면
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("locationManager_didChangeAuthorization")
        guard status == .authorizedWhenInUse else {
            return
        }
        
        //location set
//        User.sharedUser.lat = (locationManager.location?.coordinate.latitude)!
//        User.sharedUser.lon = (locationManager.location?.coordinate.longitude)!
//        self.lat = User.sharedUser.lat
//        self.lon = User.sharedUser.lon
//        //        print("lat: ",self.lat)
//        //        print("lon: ",self.lon)
//
//        self.getAtrr()
//        self.getMainRecommand()
        
//        if status == .authorizedWhenInUse{//This app is authorized to start most location services while running in the foreground.
//            //location set
//            self.lat = User.sharedUser.lat
//            self.lon = User.sharedUser.lonet
        
//            //        print("lat: ",self.lat)
//            //        print("lon: ",self.lon)
//
//            self.getAtrr()
//            self.getMainRecommand()
//        }else{
//
//        }
        
    }
    
    //나의 위치가 업데이트 되었다면
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("HomeVC.locationManager")
        if self.boolViewDidLoad{
            if User.sharedUser.boolHomeVCLocationUpdated{ // 유저가 따로 위치정보를 업데이트를 했다면
                self.lat = User.sharedUser.lat
                self.lon = User.sharedUser.lon
                
                self.getAtrr()
                self.getMainRecommand()
            }else{
                User.sharedUser.lat = (locationManager.location?.coordinate.latitude)!
                User.sharedUser.lon = (locationManager.location?.coordinate.longitude)!
                
                self.lat = User.sharedUser.lat
                self.lon = User.sharedUser.lon
                
                self.getAtrr()
                self.getMainRecommand()
            }
            self.boolViewDidLoad = false
        }
        
    }
}




