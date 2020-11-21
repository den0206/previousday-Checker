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
    @State private var didAppear = false
    
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
            
                VStack(spacing : 20) {
                    
                    HStack {
                        
                        Button(action: {
                            model.resetSex()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 24))
                        })
                        .padding()
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    if didAppear {
                        
                        Group {
                            Text("Home")
                                .font(.title)
                            
                            switch model.sex {
                            
                            case .Man :
                                Text("Man")
                            case .Woman :
                                Text("Woman")
                          
                            }
                        }
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2.0)))

                  
                        Spacer()
                    }
                    
                  
                    
                    
                    NavigationLink(destination: QuestionView(page: model.currentPage), isActive: $navActive) {
                        CustomButton(action: {self.navActive = true}, text: "始める")
                    }
                    .padding(.bottom, 20)
                    
                    
                }
                .background( LooperBackgroundView( sex: model.sex))
                .onAppear(perform: {
                    didAppear = true
                })
       
            .foregroundColor(.white)
            
            .navigationBarHidden(true)
        }        
    
      
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
