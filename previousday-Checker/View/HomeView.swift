//
//  HomeView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/16.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : DatingModel
    @State private var navActive : Bool = false
    
    var backColor : Color {
        
        switch model.sex {
        case .Man :
             return Color.blue
        case .Woman :
             return Color.pink
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                backColor.edgesIgnoringSafeArea(.all)
                
                VStack(spacing : 20) {
                    
                    
                    Spacer()
                    
                    Text("Home")
                        .font(.title2)
                    
                    switch model.sex {
                    
                    case .Man :
                        Text("Man")
                    case .Woman :
                        Text("Woman")
                  
                    }
                    Spacer()
                    
                    
                    NavigationLink(destination: FirstQView(), isActive: $navActive) {
                        CustomButton(action: {self.navActive = true}, text: "始める")
                    }
                    .padding()
                    
                }
                
            }
            
            .navigationBarHidden(true)
        }
        
    
      
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
