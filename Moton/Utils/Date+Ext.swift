//
//  Date+Moton.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 16/05/22.
//

import Foundation

extension Date {
//    var dayAndTimeText: String {
//        let timeText = formatted(date: .omitted, time: .shortened)
//        if Locale.current.calendar.isDateInToday(self) {
//            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
//            return String(format: timeFormat, timeText)
//        } else {
//            let dateText = formatted(.dateTime.month(.abbreviated).day()) // <- untuk membuat representasi tanggal yang sesuai untuk lokal pengguna saat ini.
//            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
//            return String(format: dateAndTimeFormat, dateText, timeText)
//        }
//    }
    
//    var dayText: String {
//        if Locale.current.calendar.isDateInToday(self) {
//            return NSLocalizedString("Today", comment: "Today due date description")
//        } else {
//            return formatted(.dateTime.month().day().weekday(.wide))
//        }
//    }
    
    var monthDayTimeText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d, h:mm a"
        return dateFormatter.string(from: self) // MM-dd-yyyy
    }
    
    var yearMonthDayText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: self) // MM-dd-yyyy
    }
    
//    var yearMonthDayTimeText: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE, MMM d, yyyy, h:mm a"
//        return dateFormatter.string(from: self) // MM-dd-yyyy
//    }
    
    var time: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self)
    }
}

extension Date {
    
    static func dateHours(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        
        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .hour, value: 1, to: date) else {break}
            date = newDate
        }
        
        return dates
    }
    
}
