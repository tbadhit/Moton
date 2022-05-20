//
//  DateRecommendation.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 18/05/22.
//

import Foundation

struct DateRecommendation {
  var date: Date?
  var startTime: Date
  var endTime: Date
  var duration: Int
  
  static var sampleData: [DateRecommendation] = [
//    DateRecommendation(date: Today, startTime: 08:00, endTime: 10:00, duration: 2)
  ]
  
  static func durasi(startTime: Date, endTime: Date) -> Int{
//          let fmt = ISO8601DateFormatter()
//          let startDate = fmt.date(from: startTime)!
//          let endDate = fmt.date(from: endTime)!

          let diffComponents = Calendar.current.dateComponents([.hour], from: startTime, to: endTime)
          let hours = diffComponents.hour
          return hours!
      }
  
  static func formatDateToTime(time: String) -> Date {
    let formater = DateFormatter()
    formater.timeStyle = .short
    formater.dateStyle = .none
//    let tamp = formater.string(from: datePicker.date)
//    field.text = tamp
    let iniDate = formater.date(from: time)
    return iniDate!
  }
}


