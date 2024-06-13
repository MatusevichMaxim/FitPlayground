//
//  Font+Fonts.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 11/2/23.
//

import SwiftUI

extension Font {
    public static let appTextHeader1: Font = .custom(.montserrat_extraBold, size: 22)
    public static let appTextHeader2: Font = .custom(.montserrat_extraBold, size: 20)
    
    public static let appTextCaption1: Font = .custom(.cabin_medium, size: 14)
}

extension Font {
    fileprivate enum CustomFontResource: String {
        case montserrat_extraBold = "Montserrat-ExtraBold"
        case cabin_medium = "Cabin-Medium"
    }
    
    fileprivate static func custom(_ resource: CustomFontResource, size: CGFloat) -> Font {
        .custom(resource.rawValue, size: size)
    }
}
