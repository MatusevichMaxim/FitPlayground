//
//  Image+Resources.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/12/24.
//

import SwiftUI

enum AppImageResourse: String {
    case home_icon = "home_ic"
    case calendar_icon = "calendar_ic"
    
    case square_pencil_icon = "square_pencil_ic"
    case bolt_icon = "bolt_ic"
    case folder_icon = "folder_ic"
}

extension Image {
    init(_ resourse: AppImageResourse) {
        self.init(resourse.rawValue)
    }
}
