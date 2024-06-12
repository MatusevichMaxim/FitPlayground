//
//  MainTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Group {
                HomeTabView()
                    .tabItem {
                        Image(.home_icon)
                        Text("\(.homeTabTitle)")
                    }
                
                CalendarTabView()
                    .tabItem {
                        Image(.calendar_icon)
                        Text("\(.calendarTabTitle)")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color(.appPrimary), for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

#Preview {
    MainTabView()
}
