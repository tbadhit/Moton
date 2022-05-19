//
//  DateRecommendation.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 18/05/22.
//

import Foundation

struct DateRecommendation {
  var startDate: String // ISO
  var endDate: String
  
  static var sampleData = [
    DateRecommendation(startDate: "08:00", endDate: "10:00"),
    DateRecommendation(startDate: "10:00", endDate: "12:00"),
    DateRecommendation(startDate: "12:00", endDate: "14:00"),
    DateRecommendation(startDate: "14:00", endDate: "16:00"),
    DateRecommendation(startDate: "16:00", endDate: "18:00"),
    DateRecommendation(startDate: "18:00", endDate: "20:00"),
    DateRecommendation(startDate: "20:00", endDate: "22:00"),
  ]
}


