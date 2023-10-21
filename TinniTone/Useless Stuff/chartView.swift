////
////  ProgressView.swift
////  tinnitool
////
////  Created by Elio Barisani on 15/02/22.
////
//
//import SwiftUI
//import CareKit
//import SwiftUICharts
//
//
//struct chartView: View {
//    var body: some View {
//        
//        
//        VStack {
//
//            
//            //           BAR CHART
//                        BarChartView(
//                            data: ChartData(values:
//                                                [
//                                                    ("Mon", 8),
//                                                    ("Tue", 7),
//                                                    ("Wed", 9),
//                                                    ("Thu", 9),
//                                                    ("Fri", 8),
//                                                    ("Sat", 10),
//                                                    ("Sun", 10),
//                                                    
//                                                ]
//
//
//                                           ),title: "Week Therapy", dropShadow: false)
//
//                        Spacer()
////           LINE CHART
//            LineChartView(data: [9, 12, 8, 7, 9, 8, 10], title: "Daily Progression", dropShadow: false)
//
//            Spacer()
//
//////           PIE CHART
////            PieChartView(data: [9, 12, 8, 7, 9, 8, 10], title: "Daily Therapy", dropShadow: false)
////            Spacer()
//           
//            struct ProgressBar: View {
//                @Binding var progress: Float
//                var color : Color = Color.blue
//
//                var body: some View {
//
//
//
//
//
//
//
//            }
//            }
//           
//            
//        }
//    }
//}
//
//struct chartView_Previews: PreviewProvider {
//    static var previews: some View {
//        chartView()
//            .preferredColorScheme(.light)
//        chartView()
//            .preferredColorScheme(.dark)
//        
//    
//}
//            }
//       
//
//
////let chartView = OCKCartesianChartView(type: .bar)
////
////chartView.headerView.titleLabel.text = "Doxylamine"
////
////chartView.graphView.dataSeries = [
////    OCKDataSeries(values: [0, 1, 1, 2, 3, 3, 2], title: "Doxylamine")
////]
