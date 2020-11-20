//
//  EndView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/20.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var model : DatingModel
    
    var body: some View {
        
        VStack(spacing : 10) {
            
            Text("END")
            CustomButton(action: {model.finishModel()}, text: "終了")
    

        }
        
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}
