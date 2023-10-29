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
            TrainingTabView()
                .tabItem {
                    Image(systemName: "figure.strengthtraining.traditional")
                    Text("\(.trainingTabTitle)")
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
