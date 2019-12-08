//
//  MyPageMap.swift
//  StourY
//
//  Created by 김기현 on 26/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
import GoogleMaps

extension MyPageVC: CLLocationManagerDelegate, GMSMapViewDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("locationManager_didChangeAuthorization")
        guard status == .authorizedWhenInUse else {
            return
        }
        
    }
    
    // executes when the location manager receives new location data.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locationManager_didUpdateLocations")
        guard let location = locations.first else {
            return
        }
        
        self.mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func createMarker(){
        self.arrayMarkerList.removeAll()
        self.mapView.clear()
        
        for i in 0 ..< User.sharedUser.visitList.count{
//            print("i")
            let tempData = User.sharedUser.visitList[i]
            let pos = CLLocationCoordinate2D(latitude: tempData.lat!, longitude: tempData.lon!)
            self.arrayMarkerList.append(GMSMarker(position: pos))
//            self.arrayMarkerList[i].userData = i
//            print(User.sharedUser.visitList[i].score)
//            let score = User.sharedUser.visitList[i].score as! Int
            switch User.sharedUser.visitList[i].myEvaluation{
            case 1: // bad
//                print("bad")
                self.arrayMarkerList[i].icon = UIImage(named: "icon_map_bad")
            case 2:
//                print("fine")
                self.arrayMarkerList[i].icon = UIImage(named: "icon_map_fine")
            case 3:
//                print("good")
                self.arrayMarkerList[i].icon = UIImage(named: "icon_map_good")
            default:
//                print("break")
                break
            }
            self.arrayMarkerList[i].map = self.mapView
        }
    }
}
