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

enum Pages {
   
    case Shoes
    case Tooth
    case Smell
    
    var question : String {
        switch self {
       
        case .Shoes:
            return "your shoes beautiful?"
        case .Tooth:
            return "your tooth beautiful?"
        case .Smell:
            return "You have a strong body odor?"
        }
    }
}



class DatingModel: ObservableObject {
    
    @Environment(\.presentationMode) var presentation
    
    @Published var setSex = false
    @Published var viewState : ViewState = .Home
    @Published var currentPage : Pages = .Shoes
    @Published var sex : Sex = .Man {
        didSet {
            setSex = true
        }
    }
    
    var baseColor : Color {
        switch sex {
        case .Man :
            return Color.blue
        case .Woman :
            return Color.pink
        }
    }
  
    
    func nextPage() {
        
        switch currentPage {
        
        case .Shoes:
            currentPage = .Tooth
        case .Tooth:
            currentPage = .Smell
        case .Smell:
            print("Next")
        }
    }
    
    func backPage() {
        
        
        switch currentPage {

        case .Shoes:
            print("Already")
        case .Tooth:
            currentPage = .Shoes
        case .Smell:
            currentPage = .Tooth
        }
        
       
    }
    
    
    
}
