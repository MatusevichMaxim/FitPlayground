//
//  WorkoutStatus+Extension.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/14/24.
//

import SwiftUI

extension WorkoutStatus {
    var backgroundColor: Color {
        switch self {
        case .active: return .appPrimary900
        case .completed: return .appGreen
        case .skipped: return .appRed
        }
    }
}
