//
//  RootView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/16.
//

import SwiftUI

enum ViewState {
    case Home
}

struct RootView: View {
    
    @EnvironmentObject var model : DatingModel
    
    var body: some View {
        
        if !model.setSex{
            SelectSexView()
        } else {
            switch model.sex {
            
            case .Man :
                switch model.viewState {
                
                case .Home :
                    Text("Man")
               
                }
            case .Woman :
                switch model.viewState {
                
                case .Home :
                    Text("WoMan")
               
                }
                
            }
        }
        
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
