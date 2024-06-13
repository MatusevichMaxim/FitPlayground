//
//  Font+Fonts.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 11/2/23.
//

import SwiftUI

extension Font {
    public static let appTextHeader: Font = .custom(.montserrat_extraBold, size: 22)
}

extension Font {
    fileprivate enum CustomFontResource: String {
        case montserrat_extraBold = "Montserrat-ExtraBold"
    }
    
    fileprivate static func custom(_ resource: CustomFontResource, size: CGFloat) -> Font {
        .custom(resource.rawValue, size: size)
    }
}
