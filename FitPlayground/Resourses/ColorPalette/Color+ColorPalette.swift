//
//  Color+ColorPalette.swift
//  FitPlayground
//
//  Created by Максим Матусевич on 10/30/23.
//

import SwiftUI

extension Color {
    // MARK: - Base Colors
    public static var appBackground: Color = color(for: "AppBackground")
    public static var appWhite: Color = color(for: "AppWhite")
    public static var appYellow: Color = color(for: "AppYellow")
    
    // MARK: - Text Colors
    public static var mainTextColor: Color = color(for: "MainTextColor")
    
    private static func color(for name: String) -> Color {
        Color(name)
    }
}
