//
//  Schedule.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 16/05/22.
//

import Foundation

// Propertinya smentara 3 dlu
struct Schedule {
  var title: String
  var startDate: Date
  var endDate: Date?
  var journal: String?
  var note: String
  
}

#if DEBUG
extension Schedule {
  static var sampleData = [
    Schedule(title: "UP", startDate: Date().addingTimeInterval(800.0), note: "With dede zie"),
    Schedule(title: "Doctor Strange", startDate: Date().addingTimeInterval(14000.0), note: "With ko andes"),
    Schedule(title: "KKN Desa penari", startDate: Date().addingTimeInterval(24000.0), note: "With ci erlina"),
    Schedule(title: "Danur", startDate: Date().addingTimeInterval(3200.0), note: "With ko denny"),
    Schedule(title: "Upin & Ipin", startDate: Date().addingTimeInterval(60000.0), note: "With bang tebe"),
  ]
}
#endif
