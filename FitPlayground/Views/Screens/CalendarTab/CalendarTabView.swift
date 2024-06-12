//
//  CalendarTabView.swift
//  FitPlayground
//
//  Created by Максим Матусевич on 10/28/23.
//

import SwiftUI

struct CalendarTabView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.appBackground
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("\(.dashboardTitle)")
                            .font(.appTextHeadline1)
                            .foregroundColor(.mainTextColor)
                            .padding(.top, 50)
                        
//                        NavigationLink(destination: nil) {
//                            CalendarItemView(title: "Start new", color: .appYellow)
//                        }
//                        
//                        NavigationLink(destination: WorkoutBuilderView()) {
//                            CalendarItemView(title: "Prepare workout", color: .appWhite)
//                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing], 16)
                }
            }
        }
    }
}

struct DashboardTabView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarTabView()
    }
}
