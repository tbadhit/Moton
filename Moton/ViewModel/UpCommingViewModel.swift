//
//  UpCommingViewModel.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 30/09/22.
//

import Foundation
import RxSwift
import RxCocoa

class UpCommingViewModel {
    let listUpComming: BehaviorRelay<[Schedule]> = BehaviorRelay(value: [])
    
    func fetchUpComming() {
        var listUpComming: [Schedule] = []
        var calendar = Calendar(identifier: .gregorian)
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        calendar.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)!
        
        let startDate = FreeTime.getDay(addDay: 0)
        let endDate = FreeTime.getDay(addDay: 6)
        
        let predicate = EventStore.shared.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
        let eventKitEvents = EventStore.shared.events(matching: predicate).filter({ event in
            event.title.hasPrefix("Moton")
        })
        for event in eventKitEvents {
            listUpComming.append(Schedule(title: event.title, startDate: event.startDate, endDate: event.endDate, note: event.notes ?? "Note Empty"))
        }
        
        self.listUpComming.accept(listUpComming)
    }
}
