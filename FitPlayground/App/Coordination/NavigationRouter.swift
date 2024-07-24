//
//  NavigationRouter.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/17/24.
//

import SwiftUI

final class NavigationRouter<T: Destination>: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to destination: T) {
        path.append(destination)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
}
