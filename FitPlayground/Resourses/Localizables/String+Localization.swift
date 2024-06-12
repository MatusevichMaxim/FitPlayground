//
//  String+Localization.swift
//  FitPlayground
//
//  Created by Максим Матусевич on 10/28/23.
//

import Foundation

extension String {
    // MARK: - Training tab
    public static let dashboardTitle = localizedString(for: "dashboardTitle")
    
    // MARK: - Tabs
    public static let dashboardTabTitle = localizedString(for: "dashboardTabTitle")
    public static let settingsTabTitle = localizedString(for: "settingsTabTitle")
    
    private static func localizedString(for key: String) -> String {
        NSLocalizedString(String(describing: key), comment: "")
    }
}
