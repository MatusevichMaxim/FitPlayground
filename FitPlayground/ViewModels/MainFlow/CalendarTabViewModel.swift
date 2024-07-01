//
//  CalendarTabViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/25/24.
//

import Foundation
import Combine

final class CalendarTabViewModel: ObservableObject {
    @Published var calendarData: [Int] = Array(0..<21)
    
    init() {
        
    }
}

extension CalendarTabViewModel {
    func loadPrevWeeks() {
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            let min = calendarData.min() ?? 0
            calendarData.insert(contentsOf: (min-14..<min), at: 0)
        }
    }
    
    func loadNextWeeks() {
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            let max = calendarData.max() ?? 0
            calendarData.append(contentsOf: (max+1..<max+15))
        }
    }
}
