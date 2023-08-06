//
//  UIView+Extension.swift
//  MoviesList
//
//  Created by Azaz Ur Rehman on 6/8/2023.
//

import Foundation
import UIKit

extension UIView {
    
    func makeShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: -5, height: 5)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.16
        self.layer.masksToBounds = false
    }
}
