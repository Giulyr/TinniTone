//
//  TinnitoolFirstView.swift
//  tinnitool
//
//  Created by Margarita Stepina on 20/02/22.
//

import AudioKit
import SoundpipeAudioKit
import AudioKitEX
import SwiftUI




struct CalibrationView: View {
    
    
    
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height / 3
    // Slider properties
    @State var sliderProgress: CGFloat = 0
    @State var sliderHeight: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    @State private var conductor = NoiseConductor()
    
    var body: some View {
            VStack(alignment: .center){
                // Slider
                ZStack(alignment: .bottom, content: {
                    Rectangle()
                        .fill(Color("SystemColor").opacity(0.15))
                    Rectangle()
                        .fill(Color("SystemColor"))
                        .frame(height:sliderHeight)
                })
                    .frame(width: 100, height: maxHeight)
                    .cornerRadius(35)
                    .overlay(
                        Text("\(Int(sliderProgress * 100))%").font(.largeTitle.bold())
                            .lineLimit(1)
                            .padding(.vertical, 40)
                            .offset(y: -maxHeight)
                            
                        ,alignment: .bottom
                        
                    )
                    .gesture(DragGesture(minimumDistance:0).onChanged({ (value) in
                        // getting drag value...
                        let translation = value.translation
                        sliderHeight = -translation.height + lastDragValue
                        // limiting  slider height value
                        sliderHeight = sliderHeight > maxHeight ? maxHeight: sliderHeight
                        
                        sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                        
                        let progress = sliderHeight / maxHeight
                       sliderProgress = progress <= 1.0 ? progress : 1
                        
                    }).onEnded({ (value) in
                        // storing last volume value for restoration
                      
                        sliderHeight = sliderHeight > maxHeight ? maxHeight: sliderHeight
                        
                        // negative height
                        sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                        lastDragValue = sliderHeight
                        
                        // updating Progress
                        
//                        UserDefaults.standard.set(AUValue(sliderProgress), forKey: "volume")
//
                    }))
            
                
                Text("Imposta il volume al 50%").font(.headline)
                    .padding(.top)
                    .padding(.bottom)
//                NavigationLink{
//                                TabBarView()
//                            } label: {
//                                Text("Confirm")}
                Button {
                    print("ok")
                } label: {
                    NavigationLink (destination: TabBarView().navigationBarBackButtonHidden(true)) {
                        Text("Conferma")
                            .foregroundColor(.yellow)
                    }
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Calibrazione")
        .navigationBarTitleDisplayMode(.large)
        
    }
}


struct CalibrationView_Previews: PreviewProvider {
    static var previews: some View {
        CalibrationView()
            .preferredColorScheme(.light)
        CalibrationView()
            .preferredColorScheme(.dark)
        
    
}
            }
       
        
