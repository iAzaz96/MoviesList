//
//  Alerts.swift
//  MoviesList
//
//  Created by Azaz Ur Rehman on 6/8/2023.
//

import Foundation
import SwiftMessages

class Alerts  {
    
    static func showInternetMessage(){
        let error = MessageView.viewFromNib(layout: .cardView)
        error.configureTheme(.warning)
        error.makeShadow()
        error.configureContent(title: "No Internet", body: "Please check your internet connection.")
        error.button?.isHidden = true
        SwiftMessages.defaultConfig.duration = .seconds(seconds: 2)
        SwiftMessages.show(view: error)
    }
    
    
    static func showServerErrorMessage(){
        let error = MessageView.viewFromNib(layout: .cardView)
        error.configureTheme(.error)
        error.makeShadow()
        error.configureContent(title: "Server Error", body: "Something went wrong.")
        error.button?.isHidden = true
        SwiftMessages.defaultConfig.duration = .seconds(seconds: 2)
        SwiftMessages.show(view: error)
    }
    
    static func warningMessage(title:String, body: String){
        let success = MessageView.viewFromNib(layout: .cardView)
        success.configureTheme(.warning)
        success.makeShadow()
        success.configureContent(title: title, body: body)
        success.button?.isHidden = true
        SwiftMessages.defaultConfig.duration = .seconds(seconds: 2)
        SwiftMessages.show(view: success)
    }
}

