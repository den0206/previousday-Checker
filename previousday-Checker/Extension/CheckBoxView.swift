//
//  CheckBox.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/16.
//

import SwiftUI

struct CheckBoxView: View {
    
    @Binding var checked : Bool
    
    var body: some View {
        
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color.green : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
        
    }
}

struct CheckBox_Previews: PreviewProvider {
    
    struct CheckBoxViewHolder: View {
            @State var checked = false

            var body: some View {
                CheckBoxView(checked: $checked)
            }
        }
    
    static var previews: some View {
    
        CheckBoxViewHolder()
    
    }
}
