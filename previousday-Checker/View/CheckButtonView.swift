//
//  BaseView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/17.
//

import SwiftUI

struct CheckButtonView: View {
    
    @Binding var checked : Bool
    var action : () -> Void
    var text : String = "確認しました。"
    
    var body: some View {
        
        VStack {
            
            HStack {
                CheckBoxView(checked: $checked)
                
                Text(text)
            }
            .padding()
            
            CustomButton(action: action, backgroundColor: checked ? Color.green : Color.gray)
                .disabled(!checked)
            
                
            
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        CheckButtonView(checked: .constant(false),action: {})
    }
}
