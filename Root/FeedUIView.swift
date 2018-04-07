//
//  FeedUIView.swift
//  Root
//
//  Created by Grayson on 4/6/18.
//  Copyright © 2018 therootproject. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class openthebloodymap: UIViewController {
    let primaryContactFullAddress = "N Austin Community Garden/YMCA Pedestrian Walkway, Austin, TX 78758"

    override func viewDidLoad() {
        
    }
    
    @IBAction func vnvj(_ sender: Any) {
        let testURL: NSURL = NSURL(string: "comgooglemaps-x-callback://")!
        if UIApplication.shared.canOpenURL(testURL as URL) {
            if let address = primaryContactFullAddress.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                let directionsRequest: String = "comgooglemaps-x-callback://" + "?daddr=\(address)" + "&x-success=sourceapp://?resume=true&x-source=AirApp"
                let directionsURL: NSURL = NSURL(string: directionsRequest)!
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(directionsURL as URL)) {
                    application.open(directionsURL as URL, options: [:], completionHandler: nil)
                }
            }
        } else {
            NSLog("Can't use comgooglemaps-x-callback:// on this device.")
        }
    }
    
    
}
