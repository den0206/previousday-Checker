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
    
    @State private var animation = false
    @State private var didAppear = false

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
                    
               
                    Image("heart")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.red)
                        .frame(width: 100, height: 100)
                        .scaleEffect(animation ? 0.5 : 1)
                        .animation(Animation.linear(duration: 1).repeatForever())
                        .onAppear(perform: {
                            self.animation = true
                        })
                    
                    
                    
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
        HomeView().environmentObject(DatingModel())
    }
}
