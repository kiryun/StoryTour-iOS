//
//  DetailMap.swift
//  StourY
//
//  Created by 김기현 on 19/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
import GoogleMaps

extension DetailVC: CLLocationManagerDelegate, GMSMapViewDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("locationManager_didChangeAuthorization")
        guard status == .authorizedWhenInUse else {
            return
        }
        self.locationManager.startUpdatingLocation()
        
        self.mapView.isMyLocationEnabled = true
        self.mapView.settings.myLocationButton = true
    }
    
    // executes when the location manager receives new location data.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locationManager_didUpdateLocations")
//        guard let location = locations.first else {
//            return
//        }
//        location.coordinate.latitude = lat
//        location.coordinate.longitude = lon
        
//        self.mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        var loc = CLLocationCoordinate2D()
        loc.latitude = self.lat
        loc.longitude = self.lon
        self.mapView.camera = GMSCameraPosition(target: loc, zoom: 15, bearing: 0, viewingAngle: 0)
        self.locationManager.stopUpdatingLocation()
    }
    
    func createMarker(){
//        let lat = self.detailDict["lat"] as! Double
//        let lon = self.detailDict["lon"] as! Double
        
        self.marker.position.latitude = self.lat
        self.marker.position.longitude = self.lon
        
        self.marker.icon = UIImage(named: "icon_marker")
        self.marker.map = self.mapView
    }
    
}
