//
//  BaseView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/17.
//

import SwiftUI

struct CheckButtonView: View {
    
    @Binding var checked : Bool
    var includeCheckbox : Bool = true
    var text : String = "確認しました。"
    var action : () -> Void
   
   
    
    var body: some View {
        
        VStack {
            
            if includeCheckbox {
                HStack {
                    CheckBoxView(checked: $checked)
                        
                    
                    Text(text)
                        .foregroundColor(.white)
                }
                .padding()
            }
           
            
            CustomButton(action: action, trailingColor: checked ? Color.green : Color.gray)
                
        }
    }
}

struct CustomButton : View {
    
    var action : () -> Void
    var text : String = "つぎへ"
    var trailingColor : Color = Color.yellow
    var image : Image? = nil
    
    
    var body: some View {
        Button(action: {action()}, label: {
            
            if image != nil {
                VStack(spacing :5) {
                    image!
                    Text(text)
                
                }.padding()
         
            } else {
                 Text(text)
                    .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            
            
        })
        .background(configureGradient(trailingColor: trailingColor))
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

func configureGradient(leadingColor : Color = .clear, trailingColor : Color) -> LinearGradient {
    
    return LinearGradient(gradient: Gradient(colors: [leadingColor, trailingColor]), startPoint: .leading, endPoint: .trailing)
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        
        CustomButton(action: {}, image: Image(systemName: "camera"))
//        CheckButtonView(checked: .constant(false),action: {})
    }
}
