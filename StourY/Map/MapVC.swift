//
//  MapVC.swift
//  StoryTour
//
//  Created by 김기현 on 11/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import GoogleMaps
import SnapKit

class MapVC: UIViewController {
    var screenFrameWidth = UIScreen.main.bounds.width
    
    //ui
    var navBar: UINavigationBar!
    var controlSegment = CustomSegmentControl()
    @IBOutlet weak var containerViewCollection: UIView!
    var imageViewLocation = UIImageView()
    
    var mapCollection: MapCollection!
    
    
    //data
    //map에서 page는 일단 1로 고정으로 한다.
    var intTourPageCount = 1
    var intFoodPageCount = 1
    var arrayTourList = Array<AroundForm>()
    var arrayFoodList = Array<AroundForm>()
    var arrayCurrentList = Array<AroundForm>() // 현재 선택된 list
    var arrayTourImage = Array<UIImage>()
    var arrayFoodImage = Array<UIImage>()
    
    //map
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var arrayMarkerList = Array<GMSMarker>()
    //여기에 있는 lat과 lon은 사용자가 mapView이동해서 받는 lat lon
    //처음 세팅은 User에 있는 lat, lon
    var lat: Double = 0.0
    var lon: Double = 0.0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mapCollection = segue.destination as? MapCollection {
            self.mapCollection = mapCollection
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //User에 location이 세팅이 안되어 있다면 현재위치로 세팅 한다. -> 어차피 나중에 User값을 Default로 둘거니까
        //이부분 self.lat = User.shared.lat
        //self.lon = USer.shared.lon 으로 변경 해 if문도 빼버리고
//        if !(User.sharedUser.boolLocationFlag){
////            User.sharedUser.lat = (locationManager.location?.coordinate.latitude)!
////            User.sharedUser.lon = (locationManager.location?.coordinate.longitude)!
////            User.sharedUser.boolLocationFlag = true
//            self.lat = (locationManager.location?.coordinate.latitude)!
//            self.lon = (locationManager.location?.coordinate.longitude)!
////            self.lat = 37.579108
////            self.lon = 126.990957
//        }
        self.lat = User.sharedUser.lat
        self.lon = User.sharedUser.lon
        
        
        //map init
        self.locationManager.delegate = self
        self.mapView.delegate = self
        
        self.mapView.isMyLocationEnabled = true
//        self.mapView.settings.myLocationButton = true
        
        self.getAtrr(intSegmentIdx: self.controlSegment.selectedSegmentIndex)
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.setupNaviBar()
        self.setupView()
    }

    
}

extension MapVC: CLLocationManagerDelegate, GMSMapViewDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("locationManager_didChangeAuthorization")
        guard status == .authorizedWhenInUse else {
            return
        }
//        locationManager.startUpdatingLocation()
//
//        mapView.isMyLocationEnabled = true
//        mapView.settings.myLocationButton = true
    }

    // executes when the location manager receives new location data.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locationManager_didUpdateLocations")
        guard let location = locations.first else {
            return
        }

        //lat lon 기준으로 카메라 시점 변경
        var loc = CLLocationCoordinate2D()
        loc.latitude = self.lat
        loc.longitude = self.lon
        
        mapView.camera = GMSCameraPosition(target: loc, zoom: 15, bearing: 0, viewingAngle: 0)
//        print("loc.lat:",self.lat)
//        print("loc.lon:", self.lon)
//        print(mapView.camera.target.latitude)
//        print(mapView.camera.target.longitude)
        locationManager.stopUpdatingLocation()
    }
    
    func createMarkers(){
        self.arrayMarkerList.removeAll()
        self.mapView.clear() // map에 있는 마커들 지워줌
        
        if self.controlSegment.selectedSegmentIndex == 0{ // 관광지
//            print("self.controlSegment.selelctedSegmentIndex == 0")

            for i in 0 ..< self.arrayTourList.count{
//                print(i)
                let tempData = self.arrayTourList[i]
                let pos = CLLocationCoordinate2D(latitude: tempData.lat!, longitude: tempData.lon!)
                self.arrayMarkerList.append(GMSMarker(position: pos))
                self.arrayMarkerList[i].userData = i
                self.arrayMarkerList[i].icon = UIImage(named: "icon_marker_place")
                self.arrayMarkerList[i].map = self.mapView
            }
        }else{
            for i in 0 ..< self.arrayFoodList.count{
                //                print(i)
                let tempData = self.arrayFoodList[i]
                let pos = CLLocationCoordinate2D(latitude: tempData.lat!, longitude: tempData.lon!)
                self.arrayMarkerList.append(GMSMarker(position: pos))
                self.arrayMarkerList[i].userData = i
                self.arrayMarkerList[i].icon = UIImage(named: "icon_marker_restau")
                self.arrayMarkerList[i].map = self.mapView
            }
        }
    }
    
    //마커 탭할때마다 호출 되는 함수
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//        let indexPathEx = self.mapCollection.indexPathCurrent
//        print(self.arrayFoodList[marker.userData as! Int].name)
        let indexPathTo = IndexPath(row: marker.userData as! Int, section: 0)
//        self.mapCollection.collectionView?.moveItem(at: indexPathEx!, to: indexPathTo)
        self.mapCollection.collectionView!.scrollToItem(at: indexPathTo, at: .left, animated: true)
        
        return true
    }
}
