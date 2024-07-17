//
//  Font+Fonts.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 11/2/23.
//

import SwiftUI

extension Font {
    public static let ms_extrabold_34: Font = .custom(.montserrat_extraBold, size: 34)
    public static let ms_extrabold_24: Font = .custom(.montserrat_extraBold, size: 24)
    public static let ms_extrabold_22: Font = .custom(.montserrat_extraBold, size: 22)
    public static let ms_extrabold_20: Font = .custom(.montserrat_extraBold, size: 20)
    public static let ms_extrabold_16: Font = .custom(.montserrat_extraBold, size: 16)
    public static let ms_bold_17: Font = .custom(.montserrat_bold, size: 17)
    public static let ms_bold_16: Font = .custom(.montserrat_bold, size: 16)
    public static let ms_bold_15: Font = .custom(.montserrat_bold, size: 15)
    public static let ms_bold_14: Font = .custom(.montserrat_bold, size: 14)
    public static let ms_semibold_16: Font = .custom(.montserrat_semibold, size: 16)
    public static let ms_semibold_17: Font = .custom(.montserrat_semibold, size: 17)
    
    public static let cb_bold_18: Font = .custom(.cabin_bold, size: 18)
    public static let cb_bold_14: Font = .custom(.cabin_bold, size: 14)
    public static let cb_semibold_10: Font = .custom(.cabin_semibold, size: 10)
    public static let cb_medium_14: Font = .custom(.cabin_medium, size: 14)
    public static let cb_regular_26: Font = .custom(.cabin_regular, size: 26)
    public static let cb_regular_14: Font = .custom(.cabin_regular, size: 14)
}

extension Font {
    fileprivate enum CustomFontResource: String {
        case montserrat_extraBold = "Montserrat-ExtraBold"
        case montserrat_bold = "Montserrat-Bold"
        case montserrat_semibold = "Montserrat-SemiBold"
        case cabin_bold = "Cabin-Bold"
        case cabin_semibold = "Cabin-SemiBold"
        case cabin_medium = "Cabin-Medium"
        case cabin_regular = "Cabin-Regular"
    }
    
    fileprivate static func custom(_ resource: CustomFontResource, size: CGFloat) -> Font {
        .custom(resource.rawValue, size: size)
    }
}
