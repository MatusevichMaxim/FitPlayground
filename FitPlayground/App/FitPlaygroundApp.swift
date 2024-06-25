//
//  FitPlaygroundApp.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

@main
struct FitPlaygroundApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainTabView(selectedTab: .home)
        }
    }
}
