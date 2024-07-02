//
//  DayPlan.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/1/24.
//

import Foundation

struct DayPlan: Hashable {
    let date: Date
    let workouts: [Workout]
    
    init(date: Date, workouts: [Workout] = []) {
        self.date = date
        self.workouts = workouts
    }
}
