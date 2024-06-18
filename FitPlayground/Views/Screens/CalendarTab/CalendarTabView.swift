//
//  CalendarTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct CalendarTabView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.appPrimary)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("")
                            .padding(.top, 50)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing], 16)
                }
            }
        }
    }
}

#Preview {
    CalendarTabView()
}
