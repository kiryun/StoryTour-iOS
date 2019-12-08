//
//  MyPageVC.swift
//  StourY
//
//  Created by 김기현 on 13/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMaps
import NVActivityIndicatorView

//1. segment 밑에 바가 안나옴
//2. map이 처음에 로드될때는 안나오고 셋팅 들어갔다가 나오면 제대로 로드됨
//3. visit리스트 안나오는 버그 
class MyPageVC: UIViewController {
    let screenFrameWidth = UIScreen.main.bounds.width
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var arrayMarkerList = Array<GMSMarker>()
    
    var segmentctrl: NavigationSegmentController!
    
    @IBOutlet weak var tableView: UITableView!
    var loadingTableView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0),type: .lineSpinFadeLoader, color: identityColor())
    
    var btnSetting = UIButton(type: .custom)
    var profilePicture = UIImageView()
    var userName = UILabel()
    var userEmail = UILabel()
    var modifyUser = UIButton()
    
    var nowList = Array<LikeVisitForm>()
    var arrayImage = Array<UIImage>()
//    var arrayTableLike = Array<LikeVisitForm>()
//    var arrayTableVisit = Array<LikeVisitForm>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MyPageVC.viewDidLoad")
        UIApplication.shared.statusBarView?.backgroundColor = .clear
        self.setupView()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none // tableView 선 제거
        //map
        self.mapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.isMyLocationEnabled = true
        self.mapView.settings.myLocationButton = true
        self.createMarker()
        if Reachability.isConnectedToNetwork(){
            self.getLikeVisitList()
            
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
//        self.tableView.reloadData()
    }
    
    func getLikeVisitList(){
        print("MyPageVC.getLikeVisitList")
        self.updateLikeVisitList()
        switch self.segmentctrl.selectedSegmentIndex{
        case 0://liked
            self.nowList = User.sharedUser.likeList
        case 1://visited
//            print(User.sharedUser.visitList)
            self.nowList = User.sharedUser.visitList
        default:
            break
        }
        self.arrayImage.removeAll()
        for i in 0 ..< self.nowList.count{
            self.arrayImage.append(getImageFromURL(strURL: self.nowList[i].thumnailAddr!))
        }
        self.loadingTableView.stopAnimating()
    }

}
