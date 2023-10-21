//
//  OnBoardingThirdView.swift
//  Teardrop
//
//  Created by Giulls on 26/01/23.
//

import SwiftUI

struct OnBoardingThirdView: View {
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
                    Label("", systemImage: "stethoscope")
                        .font(.system(size: 55))
                        .bold()
                        .environment(\.symbolVariants,.none)
                        .padding()
                }
                Text("Questa è un'app pensata per essere utilizzata solo a scopo informativo. Non è destinato a sostituire la consulenza, la diagnosi o il trattamento medico professionale.")
                    .bold()
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 390, height: 350)
            
            Button {
                print("OnboardingCompleted")
            } label: {
                NavigationLink (destination: CalibrationView().navigationBarBackButtonHidden(true)) {
                    Text("Calibrazione")
                        .fontWeight(.medium)
                        .padding(.horizontal, 100)
                        .padding(.vertical)
                        .font(.system(size: 30))
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(15)
                        .padding(.top, 60)
                }
            }
        }

    }
}

struct OnBoardingThirdView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingThirdView()
    }
}
