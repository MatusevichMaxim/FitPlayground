//
//  Routing.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/17/24.
//

enum RoutingAction<T: Destination> {
    case push(destination: T)
    case pop
    case popToRoot
}

protocol Routing {
    func perform<T: Destination>(action: RoutingAction<T>)
}
