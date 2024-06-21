//
//  Alignment+Hashable.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/21/24.
//

import SwiftUI

enum ContentAlignment: Hashable {
    case leading
    case center
    case trailing
    
    var rawValue: Alignment {
        switch self {
        case .leading: .leading
        case .center: .center
        case .trailing: .trailing
        }
    }
}
