//
//  DataLogModel.swift
//  tinnitool
//
//  Created by Marcelo Esposito on 01/03/22.
//

import SwiftUI

struct DayLog: Codable, Identifiable {
    var id = UUID()
    var timestamp = Date()
    var duration : TimeInterval = TimeInterval.zero
}


class LogsContainer:
//    Codable,
    ObservableObject {
    
//    make a singleton?
    
    static let dateFormatter = DateFormatter()
    static let dateComponentsFormatter = DateComponentsFormatter()
    
    @Published var dailyLogs : [DayLog]
    @Published var lastTimestamp : Date
    
//    enum CodingKeys: String, CodingKey {
//        case dailyLogs
//        case lastTimestamp
//    }
//
//
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        dailyLogs = try values.decode([DayLog].self, forKey: .dailyLogs)
//        lastTimestamp = try values.decode(Date.self, forKey: .lastTimestamp)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(dailyLogs, forKey: .dailyLogs)
//        try container.encode(lastTimestamp, forKey: .lastTimestamp)
//    }

    func playPressed() {
        
        self.lastTimestamp = Date.now
        
    }
    
    func pausePressed() {
 
        if(Calendar.current.isDateInToday(self.lastTimestamp)){
            
            self.dailyLogs[0].duration += lastTimestamp.timeIntervalSince(Date.now)
            
        }else{
            
            self.dailyLogs[0].duration += lastTimestamp.timeIntervalSince(Calendar.current.startOfDay(for: Date.now))
            
            var newDay = DayLog()
            
            newDay.duration += Calendar.current.startOfDay(for: Date.now).timeIntervalSince(Date.now)
            
            dailyLogs.insert(newDay, at: 0)
            
        }
        
    }
    
    
    init(){
        
        LogsContainer.dateFormatter.dateStyle = .medium
        
        LogsContainer.dateFormatter.timeStyle = .short
        
        LogsContainer.dateComponentsFormatter.allowedUnits = [
            .hour,
            .minute,
            .second
        ]
        LogsContainer.dateComponentsFormatter.unitsStyle = .abbreviated
        LogsContainer.dateComponentsFormatter.zeroFormattingBehavior = .pad
        
        let firstDay = DayLog()
        
        dailyLogs = [firstDay]
        
        lastTimestamp = Date.now
        
    }
    
    
    
}
