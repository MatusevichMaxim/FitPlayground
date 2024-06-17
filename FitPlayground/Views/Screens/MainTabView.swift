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
                        Image(systemName: "house")
                        Text(String.homeTabTitle)
                    }
                
                CalendarTabView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text(String.calendarTabTitle)
                    }
                
                WorkoutsTabView()
                    .tabItem {
                        Image(systemName: "dumbbell")
                        Text(String.workoutsTabTitle)
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color.appPrimary, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

#Preview {
    MainTabView()
}
