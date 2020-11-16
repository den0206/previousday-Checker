//
//  DateModel.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/16.
//

import Foundation
import SwiftUI

enum Sex {
    case Man
    case Woman
}



class DatingModel: ObservableObject {
    
    @Published var setSex = false
    @Published var viewState : ViewState = .Home
    @Published var sex : Sex = .Man {
        didSet {
            setSex = true
        }
    }
  
    
    
    
}
