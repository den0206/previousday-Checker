//
//  PieChats.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/18.
//

import SwiftUI

struct PieDate {
    let percentage : Double
    let description : String
    let color : Color
    
}

final class PieChartViewModel : ObservableObject {
    
    @Published var data = [PieDate]()
    
    init(negativePer : Double) {
        
        var negative : Double {
            return negativePer / 100.0
        }
        
        var positive : Double {
            return 1 - negative
        }
        
        let negativeData = PieDate(percentage: negative, description: "Negative", color: .blue)
        
        let positiveData = PieDate(percentage: positive, description: "Positive", color: .pink)
        
        self.data = [negativeData,positiveData]
        
    }
    
    func dataLabel(index : Int) -> String {
        
        return String(Int(self.data[index].percentage * 100)) + "%"
        
    }
}

struct PieChatView: View {
    
    var vm : PieChartViewModel
    
    var body: some View {
        ZStack {
            ForEach(0..<vm.data.count) { i in
                let currenrData = vm.data[i]
                let currentEndDegree = currenrData.percentage * 360
                let lastDegree = vm.data.prefix(i).map({$0.percentage}).reduce(0, +) * 360
                
                ZStack {
                    PieceofPie(startDegree: lastDegree, endDegree: lastDegree + currentEndDegree)
                        .fill(currenrData.color)
                    
                    GeometryReader { geo in
                        VStack {
                            Text(currenrData.description)
                            Text(vm.dataLabel(index: i))
                        }
                        .font(.custom("Avenir", size: 15))
                        .foregroundColor(.white)
                        .rotationEffect(.init(degrees: 90))
                        .position(getLabelCoodinate(in: geo.size, for: lastDegree + currentEndDegree / 2))
                        
                        
                    }
                }
                
                
            }
        }
        .rotationEffect(.init(degrees: -90))
        .frame(width: 150, height: 150)
    }
    
    private func getLabelCoodinate(in geoSize : CGSize, for degree : Double) -> CGPoint {
        
        let center = CGPoint(x: geoSize.width / 2, y: geoSize.height / 2)
        let radius = geoSize.width / 4
        
        let yCoodinate = radius * sin(CGFloat(degree) * CGFloat.pi / 180)
        let xCoodinate = radius * cos(CGFloat(degree) * CGFloat.pi / 180)
        
        return CGPoint(x: center.x + xCoodinate, y: center.y + yCoodinate)

    }
}

struct PieceofPie : Shape {
    let startDegree :Double
    let endDegree : Double
    
    func path(in rect: CGRect) -> Path {
        
        Path { p in
            
            let center = CGPoint(x: rect.midX, y: rect.midY)
            p.move(to: center)
            p.addArc(center: center, radius: rect.width / 2, startAngle: Angle(degrees: startDegree), endAngle: Angle(degrees: endDegree), clockwise: false)
            
            p.closeSubpath()
            
        }
    }
}

struct PieChats_Previews: PreviewProvider {
    static var previews: some View {
        PieChatView(vm: PieChartViewModel(negativePer: 56))
    }
}
