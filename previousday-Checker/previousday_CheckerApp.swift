//
//  previousday_CheckerApp.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/16.
//

import SwiftUI
import GoogleMobileAds

@main
struct previousday_CheckerApp: App {
   
    @StateObject var model = DatingModel()
    
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            
//            EndView().environmentObject(model)
            RootView().environmentObject(model)
        }
    }
}
