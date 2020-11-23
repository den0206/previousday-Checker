//
//  EndView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/20.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var model : DatingModel
    @State private var pages : [Pages]?
    
    var body: some View {
        
        VStack(spacing : 10) {
            
            HStack {
                Spacer()
            }
            
            Spacer()
            
        
            if let pages = pages {
                
                /// forEach Animation
                ForEach(pages.indices) { i in
                    
                    let page = pages[i]
                    
                    HStack {
                        CheckBoxView(checked: .constant(true))
                            
                        Text(page.question)
                    }
                    .padding(5)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.5 * Double(i))))
//                    .animation(Animation.spring().delay(0.2 * Double(i)))

                }
            }
               
            Spacer()
            CustomButton(action: {model.finishModel()}, text: "終了",trailingColor: .green)
                .padding(.bottom, 20)
    

        }
        .foregroundColor(.white)
        .background(LooperBackgroundView(sex: model.sex))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    self.pages = Pages.getAllPages(sex: model.sex)
                }
            }
        }

        
    }
    
    
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}
