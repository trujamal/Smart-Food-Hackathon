//
//  Map_Query.swift
//  Root
//
//  Created by Grayson on 4/6/18.
//  Copyright © 2018 therootproject. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps


class YourViewController: UIViewController {

    // Declaring Inputs
    
    
    
    
    
    // Set the status bar style to complement night-mode.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }



    override func viewDidLoad() {
        


    }
    

    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
            }
}
