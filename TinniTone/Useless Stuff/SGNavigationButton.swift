//
//  SGNavigationButton.swift
//  SGComponents
//
//  Created by Simone Giordano on 23/12/21.
//

import SwiftUI

enum NavType {
    case modal
    case fullscreenModal
    case normal
    case popover
}

//Requires navigation view in parent to work properly
struct SGNavigationButton<LabelView: View, TargetView: View>: View {
    
    @State var navigationActive: Bool = false
    var buttonLabel: LabelView
    var destinationView: TargetView
    var navigationType: NavType
    
    
    var body: some View {
        VStack {
            switch self.navigationType {
            case .normal: NavigationLink("", destination: destinationView, isActive: $navigationActive)
                
            case .modal:
                Text("A")
                    .frame(width: 0, height: 0)
                    .sheet(isPresented: $navigationActive) {
                        destinationView
                    }
            case .fullscreenModal:
                Text("B")
                    .frame(width: 0, height: 0)
                    .fullScreenCover(isPresented: $navigationActive) {
                        destinationView
                    }
                
            case .popover:
                Text("C")
                    .frame(width: 0, height: 0)
//                    .popover(isPresented: $navigationActive) {
//                        destinationView
//                    }
            }
            
            Button() {
                navigationActive = true
            } label: {
                buttonLabel
            }
            
        }
    }
    
    
}


struct TestLabel: View {
    var body: some View {
        Text("Stocazzo")
    }
}
struct SGNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            SGNavigationButton(buttonLabel: TestLabel() , destinationView: JamSessionView(), navigationType: .popover)
        }
    }
}
