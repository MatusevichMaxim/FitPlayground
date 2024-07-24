//
//  Routing.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/17/24.
//

enum RoutingAction {
    case push(destination: NavigationDestination)
    case pop
    case popToRoot
}

protocol Routing {
    func perform(action: RoutingAction)
}
