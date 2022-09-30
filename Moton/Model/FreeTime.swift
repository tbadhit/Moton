//
//  DateRecommendation.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 18/05/22.
//

import Foundation

struct FreeTime {
    var date: Date?
    var startTime: Date
    var endTime: Date
    var duration: Int
    
    static func generateListDateRecommendation() -> [Date] {
        var listDR: [Date] = []
        
        for day in 0...6 {
            listDR.append(getDay(addDay: day))
        }
        
        return listDR
    }
    
    static func getDay(addDay: Int) -> Date {
        let date = Calendar.current.date(byAdding: .day, value: addDay, to: Date())
        return date!
    }
}


