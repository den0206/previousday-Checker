//
//  InCameraView.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/22.
//

import SwiftUI

struct InCameraView: View {
    
    @Environment(\.presentationMode) var presentation
    @StateObject var vm =  AVViewModel()
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            /// Z1
            HStack{
                
                Button(action: {
                    presentation.wrappedValue.dismiss()
                    
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24))
                        .foregroundColor(.gray)
                })
                .padding()
                
                Spacer()
            }
            
            ///Z2
            
            if vm.previewLayer != nil {
                
                VideoLayerView(caLayer: vm.previewLayer)
                
            }
            
            
            
        }
        .alert(isPresented: $vm.showAlert) {
            vm.alert
        }
        
    }
}

struct VideoLayerView : UIViewControllerRepresentable {
    
    var caLayer : CALayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoLayerView>) ->  UIViewController {
        
        let vc = UIViewController()
        vc.view.layer.addSublayer(caLayer)
        caLayer.frame = vc.view.layer.frame
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<VideoLayerView>) {
        caLayer.frame = uiViewController.view.layer.frame
    }
}

struct InCameraView_Previews: PreviewProvider {
    static var previews: some View {
        InCameraView()
    }
}
