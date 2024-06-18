//
//  String+Localization.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import Foundation

extension String {
    // MARK: - Common
    public static let today = localizedString(for: "today")
    public static let min = localizedString(for: "minutes_short")
    
    // MARK: - Tabs
    public static let homeTabTitle = localizedString(for: "home_tab_title")
    public static let calendarTabTitle = localizedString(for: "calendar_tab_title")
    public static let workoutsTabTitle = localizedString(for: "workouts_tab_title")
    
    // MARK: - Muscle Groups
    public static let abs = localizedString(for: "mg_abs")
    public static let arms = localizedString(for: "mg_arms")
    public static let back = localizedString(for: "mg_back")
    public static let chest = localizedString(for: "mg_chest")
    public static let legs = localizedString(for: "mg_legs")
    public static let shoulders = localizedString(for: "mg_shoulders")
    
    // MARK: - Greetings
    public static let greetingsMorning = localizedString(for: "greetings_morning")
    
    private static func localizedString(for key: String) -> String {
        NSLocalizedString(String(describing: key), comment: "")
    }
}
