//
//  Font+Fonts.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 11/2/23.
//

import SwiftUI

extension Font {
    public static let appTextHeader1: Font = .custom(.montserrat_extraBold, size: 34)
    public static let appTextHeader2: Font = .custom(.montserrat_extraBold, size: 22)
    public static let appTextHeader3: Font = .custom(.montserrat_extraBold, size: 20)
    public static let appTextHeader4: Font = .custom(.montserrat_extraBold, size: 17)
    public static let appTextHeader5: Font = .custom(.montserrat_bold, size: 17)
    public static let appTextHeader6: Font = .custom(.montserrat_bold, size: 15)
    public static let appTextHeader7: Font = .custom(.montserrat_bold, size: 14)
    
    public static let appTextAltHeader1: Font = .custom(.cabin_regular, size: 26)
    
    public static let appTextCaption1: Font = .custom(.cabin_medium, size: 14)
    public static let appTextCaption2: Font = .custom(.cabin_regular, size: 14)
    public static let appTextCaption3: Font = .custom(.cabin_semibold, size: 10)
}

extension Font {
    fileprivate enum CustomFontResource: String {
        case montserrat_extraBold = "Montserrat-ExtraBold"
        case montserrat_bold = "Montserrat-Bold"
        case cabin_semibold = "Cabin-SemiBold"
        case cabin_medium = "Cabin-Medium"
        case cabin_regular = "Cabin-Regular"
    }
    
    fileprivate static func custom(_ resource: CustomFontResource, size: CGFloat) -> Font {
        .custom(resource.rawValue, size: size)
    }
}
