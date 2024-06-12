//
//  CalendarItemView.swift
//  FitPlayground
//
//  Created by Максим Матусевич on 11/2/23.
//

import SwiftUI

struct CalendarItemView: View {
    var title: String
    var color: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                .foregroundColor(color)
            
            Text("\(title)")
                .font(.appTextSubtitle1)
                .foregroundColor(.black)
                .padding(.leading, 16)
        }
        .frame(height: 160)
    }
}

struct DashboardItemView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarItemView(title: "Some title", color: .yellow)
    }
}
