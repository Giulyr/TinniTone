//
//  OnBoardingMainView.swift
//  Teardrop
//
//  Created by Giulls on 26/01/23.
//

import SwiftUI

struct OnBoardingMainView: View {
    
    @EnvironmentObject var appState : AppState
    @AppStorage("onboardingViewShown")
    var onboardingViewShown : Bool = false
    
    var body: some View {
        NavigationView {
            TabView {
                
                OnBoardingFirstView()
                
                OnBoardingSecondView()
                
                OnBoardingThirdView()
                
            }
            .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

struct OnBoardingMainView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingMainView()
    }
}
