//
//  NavigationRouter.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/17/24.
//

import SwiftUI

final class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to destination: NavigationDestination) {
        path.append(destination)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
}
