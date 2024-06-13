//
//  String+Localization.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import Foundation

extension String {
    // MARK: - Training tab
    public static let dashboardTitle = localizedString(for: "dashboardTitle")
    
    // MARK: - Common
    public static let today = localizedString(for: "today")
    
    // MARK: - Tabs
    public static let homeTabTitle = localizedString(for: "homeTabTitle")
    public static let calendarTabTitle = localizedString(for: "calendarTabTitle")
    public static let workoutsTabTitle = localizedString(for: "workoutsTabTitle")
    
    private static func localizedString(for key: String) -> String {
        NSLocalizedString(String(describing: key), comment: "")
    }
}
