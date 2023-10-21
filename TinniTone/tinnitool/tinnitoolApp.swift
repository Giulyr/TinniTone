//
//  tinnitoolApp.swift
//  tinnitool
//
//  Created by Marcelo Esposito on 15/02/22.
//

import SwiftUI

//extension View {
//  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
//    self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
//  }
//}

enum ViewState : String {
    case mainView
}


class AppState: ObservableObject {
    @Published var viewState: ViewState
    @Published var isAnimating: Bool
    init() {
        self.viewState = .mainView
        self.isAnimating = false
    }
}




@main
struct PROVAApp: App {
    
    @StateObject var logsCont = LogsContainer()
    
    var body: some Scene {
        WindowGroup {
            ManagerView()
                .environmentObject(AppState())
                .environmentObject(logsCont)
        }
    }
    

    
}
