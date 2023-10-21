//
//  ProgressView.swift
//  tinnitool
//
//  Created by Elio Barisani on 22/02/22.
//
//
import SwiftUI
import SwiftUICharts


struct ProgressView: View {
    //
    ////    extension Styles {
    ////        public static let barChartStyleYellowLight = ChartStyle(
    ////            backgroundColor: Color.white,
    ////            accentColor: Colors.OrangeStart,
    ////            secondGradientColor: Colors.OrangeEnd,
    ////            textColor: Color.black,
    ////            legendTextColor: Color.gray,
    ////            dropShadowColor: Color.gray)
    ////    }
    //
    //
    //
    //    @State var progressValue: Float = 0.0
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            VStack (alignment: .leading){
                Text("Progressi")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Terapia settimanale")
                    .fontWeight(.bold)
                    .padding()
                
                List{
                    Section{
                        Text("26 gen 2023, 13:23")
                        
                        Text("0h 0min 3sec")
                        
                    }header: {
                        Text("Giorno attuale")
                    }
                }
                .frame(height: 150)
                
                
                ChartView()
                Spacer()
            }
        }
        
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .preferredColorScheme(.dark)
    }
}

