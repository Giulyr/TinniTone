//
//  TestingView.swift
//  tinnitool
//
//  Created by Marcelo Esposito on 03/03/22.
//

import SwiftUI

struct TestingView: View {
    
    @EnvironmentObject var logsCont : LogsContainer
    
    var body: some View {
    
        List{
            Section{
                                    ForEach(self.logsCont.dailyLogs.indices, id: \.self) { i in
                
                                        Text(logsCont.dailyLogs[i].timestamp, formatter: LogsContainer.dateFormatter)
                
//                                        Text("\(abs(logsCont.dailyLogs[i].duration)/3600)")
                                        
                                        Text(LogsContainer.dateComponentsFormatter.string(from: abs(self.logsCont.dailyLogs[i].duration))!)
                
                                    }
                
                                }header: {
                                    Text("Current Day")
                                }
            }
        }
        
    }


struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
            .environmentObject(LogsContainer())
    }
}
