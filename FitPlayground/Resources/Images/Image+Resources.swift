//
//  Image+Resources.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/12/24.
//

import SwiftUI

extension Image {
    enum AppImageResourse: String {
        case home_icon = "home_ic"
        case calendar_icon = "calendar_ic"
    }
    
    init(_ resourse: AppImageResourse) {
        self.init(resourse.rawValue)
    }
}
