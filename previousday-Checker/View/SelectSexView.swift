//
//  SelectSexView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/16.
//

import SwiftUI

struct SelectSexView: View {
    
    @EnvironmentObject var model : DatingModel
    @State private var blockOpaity : Double = 0
    @State private  var title : String = ""
    
    var body: some View {
       
            VStack {
                                
                HStack {
                    Spacer()
                
                }
                
                Spacer()
                
                Text(title)
                    .font(.title2)
                    .foregroundColor(.white)
                    .transition(.opacity)
                    
                Spacer()
                
                HStack(spacing : 10) {
                    
                    CustomButton( action: {model.sex = .Man}, text: "男性", trailingColor: Color.blue)
                    CustomButton( action: {model.sex = .Woman}, text: "女性", trailingColor: Color.pink)
                }
                .opacity(blockOpaity)
                .onAppear(perform: {
                    withAnimation(.easeInOut(duration: 2.0)) {
                        blockOpaity = 1.0
                    }
                })
                .padding()
                
                AdBannerView()
                    .frame(width: 320, height: 50)
                    .padding(.bottom,10)
                
            }
           
            .background(LooperBackgroundView())
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        self.title = "For a beautiful Encounter.."

                    }
                }
            }
 
    }
}



struct SelectSexView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSexView()
    }
}
