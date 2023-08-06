//
//  AppColors.swift
//  MoviesList
//
//  Created by Azaz Ur Rehman on 5/8/2023.
//

import Foundation
import UIKit

enum AssetsColors{
    case Yellow
}

extension UIColor{
    
    static func appColors(color:AssetsColors)-> UIColor?{
        
        switch color{
        case .Yellow:
            return UIColor(named: "Yellow")
        }
    }
}
