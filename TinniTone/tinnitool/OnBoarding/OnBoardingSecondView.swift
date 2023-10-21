//
//  OnBoardingSecondView.swift
//  Teardrop
//
//  Created by Giulls on 26/01/23.
//

import SwiftUI

struct OnBoardingSecondView: View {
    @EnvironmentObject var appState : AppState
    @AppStorage("onboardingViewShown")
    var onboardingViewShown : Bool = false

    var body: some View {
        VStack {
            VStack {
                Text("Welcome to Tinnitool")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .opacity(0)
                
                ZStack {
                    Image("oval")
                        .resizable()
                        .frame(width: 120, height: 120)
                    
                    Label("", systemImage: "speaker.wave.2")
                        .font(.system(size: 55))
                        .bold()
                        .environment(\.symbolVariants,.none)
                        .padding()
                }
                
                Text("Funziona implementando la Tinnutus Retraining Theraphy con l'uso di rumori specifici e altri tipi di tecniche sperimentali")
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .frame(width: 390, height: 350)
            .offset(y: -24)

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

struct OnBoardingSecondView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSecondView()
    }
}
