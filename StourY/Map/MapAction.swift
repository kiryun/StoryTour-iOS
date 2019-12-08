//
//  MapAction.swift
//  StourY
//
//  Created by 김기현 on 09/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation
import GoogleMaps

extension MapVC{
    @objc func changedSegment(value: CustomSegmentControl){
        print("MapVC.changedSegment")
        switch value.selectedSegmentIndex{
        case 0:
            self.controlSegment.selectedSegmentIndex = 0
//            self.arrayCurrentList = self.arrayTourList
        case 1:
            self.controlSegment.selectedSegmentIndex = 1
//            self.arrayCurrentList = self.arrayFoodList
        default:
            break
        }
        
        self.getAtrr(intSegmentIdx: self.controlSegment.selectedSegmentIndex)
    }
    
    @objc func tappedLocationButton(btn: UIButton){
        print("MapVC.tappedLocationButton")
        var loc = CLLocationCoordinate2D()
        loc = (self.locationManager.location?.coordinate)!
        self.mapView.camera = GMSCameraPosition(target: loc, zoom: 15, bearing: 0, viewingAngle: 0)
    }
    
    @objc func tappedRefreshButton(btn: UIButton){
        print("MapVc.tappedRefreshButton")
        self.lat = self.mapView.camera.target.latitude
        self.lon = self.mapView.camera.target.longitude
        self.getAtrr(intSegmentIdx: self.controlSegment.selectedSegmentIndex)
    }
    
}
