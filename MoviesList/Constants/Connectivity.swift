//
//  CheckInternetConnection.swift
//  CoupansTaxiHub
//
//  Created by TekNords on 11/29/18.
//  Copyright © 2018 TekNords. All rights reserved.
//

import UIKit
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
}
