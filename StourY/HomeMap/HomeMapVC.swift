//
//  HomeMapVC.swift
//  StourY
//
//  Created by 김기현 on 05/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import GoogleMaps
import SnapKit

class HomeMapVC: UIViewController {
    var screenFrameWidth = UIScreen.main.bounds.width
    var navBar: UINavigationBar!
    var locationManager = CLLocationManager()
    
    var marker = GMSMarker()
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNaviBar()
        self.setupView()
        
        //map init
        self.locationManager.delegate = self
        self.mapView.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.mapView.isMyLocationEnabled = true
        self.mapView.settings.myLocationButton = true
        
//        print(marker.position.latitude)
//        print(marker.position.longitude)
    }

}


extension HomeMapVC: CLLocationManagerDelegate, GMSMapViewDelegate{
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
        
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        locationManager.stopUpdatingLocation()
    }
    
    //
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("mapView.didTapAt")
        let lat = coordinate.latitude
        let lon = coordinate.longitude
        
        self.marker.position.latitude = lat
        self.marker.position.longitude = lon
        
        User.sharedUser.lat = lat
        User.sharedUser.lon = lon
        
        self.marker.icon = UIImage(named: "icon_marker")
        self.marker.map = self.mapView
        User.sharedUser.boolHomeVCLocationUpdated = true
    }
}
