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
    
    var body: some View {
       
            VStack {
                
                Spacer()
                
                HStack {
                    Spacer()
                }
                
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
                
                
            }.background(LooperBackgroundView())
 
    }
}



struct SelectSexView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSexView()
    }
}
