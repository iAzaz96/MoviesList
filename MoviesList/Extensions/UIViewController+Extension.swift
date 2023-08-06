//
//  UIViewController+Extension.swift
//  MoviesList
//
//  Created by Azaz Ur Rehman on 5/8/2023.
//

import Foundation
import UIKit

extension UIViewController{
    
    func startLoading(){
        
        ProgressHUD.animationType = .horizontalCirclesPulse
        ProgressHUD.colorAnimation = UIColor.appColors(color: .Yellow) ?? .black
        ProgressHUD.show()
        
    }
    
    func stopLoading(){
        ProgressHUD.dismiss()
    }
}
