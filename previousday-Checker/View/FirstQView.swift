//
//  FirstQView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/17.
//

import SwiftUI

struct FirstQView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @EnvironmentObject var model : DatingModel
    @State private var showCheckBox = false
    @State private var checked = false
    
    @State private var textOpacity : Double = 0
    
    var body: some View {
        
            
            VStack {
                
                HStack {
                    
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    })
                    .padding()
                    
                    Spacer()
                }
                
                /// present circle graph
                
                Spacer()
                
                Text("Is your Shoes beautiful?")
                    .opacity(textOpacity)
                    .onAppear(perform: {
                        withAnimation(.easeInOut(duration: 2.0)) {
                            textOpacity = 1.0
                        }
                    })
                
                Spacer()
                
                if showCheckBox {
                    CheckButtonView(checked: $checked, action: {})
                        
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0)))
                        .padding()
                        
                }
                
                Spacer()
            
            }
            .background(model.baseColor.ignoresSafeArea(.all, edges: .all))
            .onTapGesture{
                withAnimation(.easeInOut(duration: 1.0),
                              {
                                self.showCheckBox = true
                              })
                
            }
            
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
        
        
    }
}

struct FirstQView_Previews: PreviewProvider {
    static var previews: some View {
        FirstQView()
    }
}