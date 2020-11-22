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

enum Pages : CaseIterable{
   
    case Shoes
    case Tooth
    case Nail
    case Smell
    
    var question : String {
        switch self {
       
        case .Shoes:
            return "your shoes beautiful?"
        case .Tooth:
            return "your tooth beautiful?"
        case .Nail :
            return "your nail Beautiful?"
        case .Smell:
            return "You have a strong body odor?"
        }
    }
    
    func getChart(sex : Sex) -> PieChartViewModel {
        
        switch self {
        
        case .Shoes:
            return sex == .Man ? PieChartViewModel(negativePer: 50) : PieChartViewModel(negativePer: 51)
        case .Tooth:
            return sex == .Man ? PieChartViewModel(negativePer: 60) : PieChartViewModel(negativePer: 61)
        case .Nail :
            return sex == .Man ? PieChartViewModel(negativePer: 35) : PieChartViewModel(negativePer: 88)
        case .Smell:
            return sex == .Man ? PieChartViewModel(negativePer: 70) : PieChartViewModel(negativePer: 71)
        }
       
    }
}


final class DatingModel: ObservableObject {
    
    @Environment(\.presentationMode) var presentation
    
    @Published var setSex = false
    @Published var viewState : ViewState = .Home
    @Published var currentPage : Pages = .Shoes
    @Published var sex : Sex = .Man {
        didSet {
            setSex = true
        }
    }
    
    
    var isLastQuestion : Bool {
        
        return currentPage == .Smell
    }

    
    //MARK: - functions
    
    func finishModel() {
        self.currentPage = .Shoes
        self.viewState = .Home
    }
    
    func resetSex() {
        self.setSex = false
    }
    
    func nextPage() {
        
        switch currentPage {
        
        case .Shoes:
            currentPage = .Tooth
        case .Tooth:
            currentPage = .Nail
        case .Nail:
            currentPage = .Nail
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
        case .Nail:
            currentPage = .Tooth
        case .Smell:
            currentPage = .Nail
        }
        
       
    }
    
  
    
    
}

//
//var pieChart : PieChartViewModel {
//
//    /// switch Sex
////        switch sex {}
//
//    switch currentPage {
//
//    case .Shoes:
//        return PieChartViewModel(negativePer: 50)
//    case .Tooth:
//        return PieChartViewModel(negativePer: 60)
//    case .Smell:
//        return PieChartViewModel(negativePer: 70)
//    }
//}
//
//var videoName : String {
//
//    switch currentPage {
//
//    case .Shoes :
//        return sex == .Man ? "" : ""
//    case .Tooth :
//        return sex == .Man ? "" : ""
//    case .Smell :
//        return sex == .Man ? "" : ""
//    }
//}
