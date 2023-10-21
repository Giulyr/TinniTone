//  ChartView.swift
//  tinnitool
//
//  Created by Elio Barisani on 19/01/23.


import SwiftUI
import Charts

struct ChartView: View{
    
    var viewMonths: [ViewMonth] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1), viewCount:  Int.random(in: 0...10)),
        .init(date: Date.from(year: 2023, month: 2, day: 2), viewCount:  Int.random(in: 0...10)),
        .init(date: Date.from(year: 2023, month: 3, day: 3), viewCount:  Int.random(in: 0...10)),
        .init(date: Date.from(year: 2023, month: 4, day: 4), viewCount:  Int.random(in: 0...10)),
        .init(date: Date.from(year: 2023, month: 5, day: 5), viewCount:  Int.random(in: 0...10)),
        .init(date: Date.from(year: 2023, month: 6, day: 6), viewCount:  Int.random(in: 0...10)),
        .init(date: Date.from(year: 2023, month: 7, day: 7), viewCount:  Int.random(in: 0...10)),
      
    ]
    
    func media() -> Double{
        
        var med: Double = 0
        
        for i in 0...viewMonths.count-1{
            
            med = med + Double(viewMonths[i].viewCount )
            
        }
        
        return med/12
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 4){
            Text("Progressi")
                .fontWeight(.bold)
            
            Text("Media:" + String(media()))
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom,12)
            Chart{
                RuleMark(y: .value("",10))
                    .foregroundStyle(Color.red)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                    .annotation(alignment: .leading){
                      
                    }
                ForEach(viewMonths){viewMonths in
                    BarMark(x: .value("Month", viewMonths.date, unit: .month),
                            y: .value("Views", viewMonths.viewCount))
                    .foregroundStyle(Color.blue.gradient)
                    
                }
                
            }
            .frame(height: 180)
            .chartYScale(domain: 0...20)
            .chartXAxis{
                AxisMarks(values: viewMonths.map({$0.date})) { date in
                    AxisValueLabel(format: .dateTime.day())
                }
            }
            
        }.padding()
    }
}


struct ChartView_Previews: PreviewProvider {
    static var previews: some View{
        ChartView()
    }
}

struct ViewMonth: Identifiable{
    let id = UUID()
    let date: Date
    let viewCount: Int
}

extension Date{
    
    static func from(year: Int, month: Int, day: Int) -> Date{
            let components = DateComponents(year: year, month: month, day: day)
            return Calendar.current.date(from: components)!
        }
}
