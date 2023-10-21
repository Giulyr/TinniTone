//
//  ProfileView.swift
//  tinnitool
//
//  Created by Elio Barisani on 15/02/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Profilo")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            
            Form {
                
                
                Section(header: Text("Calibrazione")){
                    
                    NavigationLink(destination: CalibrationView().navigationBarBackButtonHidden(true)) {
                        Text("Recalibrazione")
                    }
                    
                    NavigationLink {
                        CalibrationHistoryView()
                    } label: {
                        Text("Storico Calibrazione")}
                    
                }
                
                Section(header: Text("Inizio Terapia")){
                    NavigationLink {
                        StartDateView()
                    } label: {
                        Text("Data di inizio corrente")}
                    
                    NavigationLink {
                        DateHistoryView()
                    } label: {
                        Text("Storico date")}
                }
                
            }
        }
//
//            .navigationTitle("Profile")}
//        .padding(.bottom)
//        .navigationBarBackButtonHidden(true)
        
    }
    
    
    
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.light)
            .preferredColorScheme(.dark)
        
        
    }
}




