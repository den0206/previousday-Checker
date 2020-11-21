//
//  previousday_CheckerApp.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/16.
//

import SwiftUI

@main
struct previousday_CheckerApp: App {
   
    @StateObject var model = DatingModel()
    
    var body: some Scene {
        WindowGroup {
            
//            EndView().environmentObject(model)
            RootView().environmentObject(model)
        }
    }
}
