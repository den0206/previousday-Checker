//
//  FirstQView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/17.
//

import SwiftUI

struct QuestionView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @EnvironmentObject var model : DatingModel
    @State private var showCheckBox = false
    @State private var checked = false
    @State private var navActive : Bool = false
    
    var page : Pages
    
    @State private var textOpacity : Double = 0
    @State private var chartOpcity : Double = 0
    @State private var showCamera = false
    
    var body: some View {
        
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                        model.backPage()
                        
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24))
                    })
                    .padding()
                    
                    Spacer()
                }
                    
                
                Spacer()
                
                    Text(page.question)
                        .font(.title)
                        .opacity(textOpacity)
                        .onAppear(perform: {
                            withAnimation(.easeInOut(duration: 3.0)) {
                                textOpacity = 1.0
                            }
                        })
                      
                    
               
        
             
                
                /// present circle graph
                
                Spacer()
                
                PieChatView(vm: page.getChart(sex: model.sex))
                    .opacity(chartOpcity)
                    .onAppear(perform: {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            chartOpcity = 1.0
                        }
                    })
                
                
                if page == .Tooth {
                    
                    Spacer()
                    
                    CustomButton(action: {showCamera = true}, text: "Active In Camera", trailingColor: .yellow)
                        .opacity(textOpacity)
                        .padding()
                        .fullScreenCover(isPresented: $showCamera) {
                            InCameraView()
                        }
                }
                  
                    
                
                Spacer()
                
                
                
                if showCheckBox {
                    
                    HStack {
                        CheckBoxView(checked: $checked)
                            .padding(.trailing, 5)
                        
                        Text( !model.isLastQuestion ? "理解しました。" : "完了")
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    
                    /// exclude CheckBox cuz Disable Button
                    NavigationLink(destination:  QuestionView(page: model.currentPage), isActive: $navActive, label: {
                        
                        
                        CheckButtonView(checked: $checked,includeCheckbox: false, action: {
                            if !model.isLastQuestion {
                                model.nextPage()
                                navActive = true
                            } else {
                                // TODO: - finish
                                self.model.viewState = .Finish
                            }
                            
                            
                        })
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0)))
                        .padding(.bottom, 20)
                    })
                    .disabled(checked ? false : true)
                    
                }
                
                Spacer()
                
            }
            .foregroundColor(.white)
            .background(LooperBackgroundView(fileName: nil, sex: model.sex))
//            .background(LooperBackgroundView(fileName: model.currentPage.getViedeo(sex: model.sex), sex: model.sex))

            .onTapGesture{
                withAnimation(.easeInOut(duration: 1.0),
                              {
                                self.showCheckBox = true
                              })
                
            }
            
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
        
        
    }
}

struct FirstQView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView( page: .Shoes)
    }
}
