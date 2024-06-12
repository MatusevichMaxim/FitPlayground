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
            DashboardTabView()
                .tabItem {
                    Image(systemName: "figure.strengthtraining.traditional")
                    Text("\(.dashboardTabTitle)")
                }
            SettingsTabView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("\(.settingsTabTitle)")
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
