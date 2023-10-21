//
//  OnBoardingView.swift
//  tinnitool
//
//  Created by Elio Barisani on 15/02/22.
//

import SwiftUI

struct OnBoardingFirstView: View {
    
    @EnvironmentObject var appState : AppState
    @AppStorage("onboardingViewShown")
    var onboardingViewShown : Bool = false
    
    var body: some View {
        VStack {
            VStack{
                    Text("Benvenuto su TinniTone")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                       
                    VStack {
                        ZStack {
                            Image("oval")
                                .resizable()
                                .frame(width: 120, height: 120)
                            
                            Label("", systemImage: "ear.and.waveform")
                                .font(.system(size: 55))
                                .bold()
                                .environment(\.symbolVariants,.none)
                            .padding()
                        
                        }
                        
                        Text("Un app per persone che soffrono di tinnutus")
                            .bold()
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)

                    }
                    .frame(width: 390)

                    .offset(y:177)

                    Spacer()
        
            }
            
            Text("Calibration")
                .fontWeight(.medium)
                .padding(.horizontal, 100)
                .padding(.vertical)
                .font(.system(size: 30))
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(15)
                .padding(.top, 60)
                .opacity(0)
        }
        }
}

struct OnBoardingView_Previews: PreviewProvider {    
    static var previews: some View {
        OnBoardingFirstView()
    }
}
