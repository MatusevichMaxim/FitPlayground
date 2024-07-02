//
//  CalendarTabViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/25/24.
//

import Foundation
import Combine

final class CalendarTabViewModel: ObservableObject {
    @Published var planData: [DayPlan] = []
    
    init(dialogCoordinator: DialogCoordination) {
        self.dialogCoordinator = dialogCoordinator
        
        initialLoading()
    }
    
    private let dialogCoordinator: DialogCoordination
    private let today = Date().erasedTime
    private let calendar = Calendar.current
}

extension CalendarTabViewModel {
    var initialPlan: DayPlan? { planData.first(where: { $0.date == today }) }
    
    func loadPrevWeeks() {
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            
            guard let earlyPlan,
                  let startDate = calendar.date(byAdding: .day, value: -15, to: earlyPlan.date),
                  let endDate = calendar.date(byAdding: .day, value: -1, to: earlyPlan.date) else { return }
            
            loadPlan(startDate: startDate, endDate: endDate)
        }
    }
    
    func loadNextWeeks() {
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            
            guard let laterPlan,
                  let startDate = calendar.date(byAdding: .day, value: 1, to: laterPlan.date),
                  let endDate = calendar.date(byAdding: .day, value: 15, to: laterPlan.date) else { return }
            
            loadPlan(startDate: startDate, endDate: endDate)
        }
    }
    
    func onItemTapped(isDone: Bool) {
        dialogCoordinator.showDialog(type: .activityOption(isDone: isDone))
    }
    
    func onAddNewWorkout() {
        dialogCoordinator.showDialog(type: .createNew)
    }
}

extension CalendarTabViewModel {
    private var earlyPlan: DayPlan? { planData.first }
    private var laterPlan: DayPlan? { planData.last }
    
    private func initialLoading() {
        guard let startDate = calendar.date(byAdding: .day, value: -7, to: today),
              let endDate = calendar.date(byAdding: .day, value: 7, to: today) else { return }
        
        loadPlan(startDate: startDate, endDate: endDate)
    }
    
    private func loadPlan(startDate: Date, endDate: Date) {
        var newPlans: [DayPlan] = []
        var currentDate = startDate
        
        while currentDate <= endDate {
            newPlans.append(
                PreviewData.scheduledWorkouts.first(where: { $0.date == currentDate }) ?? .init(date: currentDate)
            )
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            if let earlyPlan = self.earlyPlan, startDate < earlyPlan.date {
                planData.insert(contentsOf: newPlans, at: 0)
            } else {
                planData.append(contentsOf: newPlans)
            }
        }
    }
}
