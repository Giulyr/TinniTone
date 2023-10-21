//
//  ManagerView.swift
//  Teardrop
//
//  Created by Giulls on 26/01/23.
//

import SwiftUI
import SpriteKit
import AVFoundation

extension UserDefaults {
    var isOnboardingCompleted: Bool{
        get {
            return (UserDefaults.standard.value(forKey: "onboardingViewShown")
                    as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue , forKey: "onboardingViewShown")
        }
    }
}


struct ManagerView: View {
    @EnvironmentObject var appState : AppState
    
        var body: some View {
            if UserDefaults.standard.isOnboardingCompleted  {
                TabBarView()
            } else {
                OnBoardingMainView()
            }
        }
    }




struct ManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}
