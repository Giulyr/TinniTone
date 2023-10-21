//
//  MainView.swift
//  tinnitool
//
//  Created by Elio Barisani on 16/02/22.


import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var appState : AppState
    @EnvironmentObject var logsCont : LogsContainer
    
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance()
        //            .barTintColor = UIColor(Color(red:24/255, green: 24/255, blue:24/255)
        
        
    }
    
    //    @AppStorage ("onBoardingNeeded") var onBoardingNeeded: Bool = true
    
    var body: some View {
        
        
        
        NavigationView {
            TabView{
                
                JamSessionView()
                    .environmentObject(logsCont)
                    .tabItem{
                        Label("Trattamento", systemImage: "ear.and.waveform")
                            .environment(\.symbolVariants,.none)
                        
                    }
                
                ProgressView()
                    .tabItem{
                        Label("Progressi", systemImage: "chart.bar")
                            .environment(\.symbolVariants,.none)
                        
                    }
                
                ProfileView()
                    .tabItem{
                        Label("Profilo", systemImage: "person")
                            .environment(\.symbolVariants,.none)
                        
                    }
                
                
            }
            .accentColor(Color(red:255/255, green: 204/255, blue:0/255))
        }
        .onAppear(perform: {
            UserDefaults.standard.isOnboardingCompleted = true        })
        
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(LogsContainer())
            .environmentObject(AppState())
        
    }
}
