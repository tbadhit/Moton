//
//  RewatchDatePickerViewModel.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 30/09/22.
//

import Foundation
import RxSwift
import RxCocoa

class RewatchDatePickerViewModel {
    let listDateRecommendation: BehaviorRelay<[Date]> = BehaviorRelay(value: [])
    
    func fetchDateRecommendation() {
        let today = Date()
        var listDateRecommendation: [Date] = []
        listDateRecommendation = [
          getDateRecommendation(date: today, addDay: 0),
          getDateRecommendation(date: today, addDay: 1),
          getDateRecommendation(date: today, addDay: 2),
          getDateRecommendation(date: today, addDay: 3),
          getDateRecommendation(date: today, addDay: 4),
          getDateRecommendation(date: today, addDay: 5),
          getDateRecommendation(date: today, addDay: 6)
        ]
        
        self.listDateRecommendation.accept(listDateRecommendation)
    }
      
    private func getDateRecommendation(date: Date, addDay: Int) -> Date {
        let date = Calendar.current.date(byAdding: .day, value: addDay, to: Date())

        return date!
    }
}
