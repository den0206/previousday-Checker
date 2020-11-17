//
//  SelectSexView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/16.
//

import SwiftUI

struct SelectSexView: View {
    
    @EnvironmentObject var model : DatingModel
    
    var body: some View {
        
        VStack {
            
            HStack(spacing : 10) {
                
                CustomButton(action: {model.sex = .Man}, text: "男性", backgroundColor: Color.blue)
                CustomButton(action: {model.sex = .Woman}, text: "女性", backgroundColor: Color.pink)
            }
            
        }
    }
}

struct CustomButton : View {
    
    var action : () -> Void
    var text : String = "つぎへ"
    var backgroundColor : Color = Color.green

    
    
    var body: some View {
        Button(action: {action()}, label: {
            Text(text)
                .frame(width: 150, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(backgroundColor)
                .foregroundColor(.white)
                .clipShape(Capsule())
        })
    }
}

struct SelectSexView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSexView()
    }
}
