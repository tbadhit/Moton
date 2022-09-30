//
//  DateViewModel.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 30/09/22.
//

import Foundation
import RxCocoa
import RxSwift

class DateViewModel {
    let listDateRecommendation: BehaviorRelay<[Date]> = BehaviorRelay(value: [])
    
    func generateListDateRecommendation() {
        var listDR: [Date] = []
        
        for day in 0...6 {
            listDR.append(getDay(addDay: day))
        }
        
        listDateRecommendation.accept(listDR)
    }
    
    private func getDay(addDay: Int) -> Date {
        let date = Calendar.current.date(byAdding: .day, value: addDay, to: Date())
        return date!
    }
}
