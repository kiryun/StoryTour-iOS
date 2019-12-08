//
//  GuidesMap.swift
//  StourY
//
//  Created by 김기현 on 27/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
import GoogleMaps

extension ToonAudioGuideVC: CLLocationManagerDelegate, GMSMapViewDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("locationManager_didChangeAuthorization")
        guard status == .authorizedWhenInUse else {
            return
        }
    }
    
    // executes when the location manager receives new location data.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locationManager_didUpdateLocations")
        
        var loc = CLLocationCoordinate2D()
        loc.latitude = self.lat
        loc.longitude = self.lon
        
        mapView.camera = GMSCameraPosition(target: loc, zoom: 15, bearing: 0, viewingAngle: 0)
        
        locationManager.stopUpdatingLocation()
    }
    
    func createMarkers()
    {
        self.markerList.removeAll()
        self.mapView.clear()
        
        if self.segmentCtrl.selectedSegmentIndex == 0{
//            print("current Segment: ", self.segmentCtrl.selectedSegmentIndex)
            for i in 0 ..< self.audioGuideList.count{
                let tempData = self.audioGuideList[i]
                let pos = CLLocationCoordinate2D(latitude: tempData.lat!, longitude: tempData.lon!)
                self.markerList.append(GMSMarker(position: pos))
                self.markerList[i].userData = i
                self.markerList[i].icon = UIImage(named: "btn_guide_voice")//#imageLiteral(resourceName: "btn_guide_voice") //음성 아이콘
                self.markerList[i].map = self.mapView
            }
        }else{
            print("current Segment: ", self.segmentCtrl.selectedSegmentIndex)
            for i in 0 ..< self.toonGuideList.count{
                let tempData = self.toonGuideList[i]
                let pos = CLLocationCoordinate2D(latitude: tempData.lat!, longitude: tempData.lon!)
                self.markerList.append(GMSMarker(position: pos))
                self.markerList[i].userData = i
                self.markerList[i].icon = UIImage(named: "icon_guide_toon")//카툰 아이콘
                self.markerList[i].map = self.mapView
            }
        }
        
    }

    //마커 탭할때마다 호출 되는 함수
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
//        print("currentMarker userData: ", marker.userData as! Int)
        self.currentMarker = marker.userData as! Int
        
        if self.segmentCtrl.selectedSegmentIndex == 0{
            self.playBar.removeFromSuperview()
            //playBar setup
            if self.audioGuideList.count != 0{
                self.addPlayBarVC()
            }
        }else{
            self.playBar.removeFromSuperview()
            let toonGuideVC = self.storyboard?.instantiateViewController(withIdentifier: "ToonGuideVC") as! ToonGuideVC
            toonGuideVC.toonGuideList = toonGuideList[self.currentMarker].cartoonImageAddressList!
            self.present(toonGuideVC, animated: true, completion: nil)
        }
        
        return true
    }
}
