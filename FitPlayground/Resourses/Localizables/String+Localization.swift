//
//  String+Localization.swift
//  FitPlayground
//
//  Created by Максим Матусевич on 10/28/23.
//

import Foundation

extension String {
    // MARK: - Training tab
    public static let trainingTabTitle: String = localizedString(for: "trainingTabTitle")
    
    // MARK: - Settings tab
    public static let settingsTabTitle: String = localizedString(for: "settingsTabTitle")
    
    private static func localizedString(for key: String) -> String {
        NSLocalizedString(String(describing: key), comment: "")
    }
}
