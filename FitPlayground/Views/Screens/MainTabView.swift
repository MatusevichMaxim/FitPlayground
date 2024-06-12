//
//  MainTabView.swift
//  FitPlayground
//
//  Created by Максим Матусевич on 10/28/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeTabView()
                .tabItem {
                    Image(systemName: "house")
                    Text("\(.homeTabTitle)")
                }
            
            CalendarTabView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("\(.calendarTabTitle)")
                }
        }
        .accentColor(.green)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
