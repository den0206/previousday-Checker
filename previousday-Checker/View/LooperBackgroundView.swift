//
//  LooperBackgroundView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/20.
//

import SwiftUI

struct LooperBackgroundView: View {
    
    var fileName : String? = nil
    var sex : Sex? = nil
    
    var body: some View {
        
        
        LoopMoviewView(fileName: fileName)
            .blur(radius: 1)
            .overlay(layView(sex: sex))
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct layView : View{
    var sex : Sex? = nil
    
    var body: some View {
        
        switch sex {
        case .Man :
            Color.blue.opacity(0.2)
        case .Woman :
            Color.pink.opacity(0.2)
        default:
            Color.white.opacity(0.5)

        }
    }
}

