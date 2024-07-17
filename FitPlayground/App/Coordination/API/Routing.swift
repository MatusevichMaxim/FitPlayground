//
//  Routing.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/17/24.
//

protocol Routing {
    func navigate(to destination: NavigationDestination)
    func navigateBack()
    func navigateToRoot()
}
