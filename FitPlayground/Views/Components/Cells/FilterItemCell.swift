//
//  FilterItemCell.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 8/1/24.
//

import SwiftUI

struct FilterItemCell: View {
    let resource: AppImageResourse
    let title: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(resource)
                .foregroundStyle(Color.textPrimary)
            
            Text(title)
                .font(.ms_bold_17)
                .foregroundStyle(Color.textPrimary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    FilterItemCell(resource: .human_filter_icon, title: "Any Muscle")
}
