//
//  WatchHistoryViewModel.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 28/09/22.
//

import Foundation
import RxSwift
import RxCocoa

class WatchHistoryViewModel {
    let listWatchHistory: BehaviorRelay<[Schedule]> = BehaviorRelay(value: [])
    
    func fetchWatchHistory() {
        
        var historyList: [Schedule] = []
        
        var calendar = Calendar(identifier: .gregorian)
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        calendar.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)!
        let today = calendar.startOfDay(for: Date())
        
        let startDate = setDate(date: today, addDay: -6)
        let endDate = setDate(date: today, addDay: 0)
        
        let predicate = EventStore.shared.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
        let eventKitEvents = EventStore.shared.events(matching: predicate).filter({ event in
            event.title.hasPrefix("Moton")
        }).filter { event in
            event.startDate < Date.now
        }
        for event in eventKitEvents {
            historyList.append(Schedule(title: event.title, startDate: event.startDate, endDate: event.endDate, note: event.notes ?? "Note Empty"))
        }
        
        self.listWatchHistory.accept(historyList)
    }
    
    func setDate(date: Date, addDay: Int) -> Date {
        let date = Calendar.current.date(byAdding: .day, value: addDay, to: Date())
        return date!
    }
}
