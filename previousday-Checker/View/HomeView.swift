//
//  HomeView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/16.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : DatingModel
    
    var body: some View {
        VStack {
            
            Text("Home")
                .font(.title2)
            
            switch model.sex {
            case .Man :
                Text("Man")
            case .Woman :
                Text("Woman")
          
            }
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
