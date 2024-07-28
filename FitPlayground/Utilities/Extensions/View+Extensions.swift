//
//  View+Extensions.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/18/24.
//

import SwiftUI
import UIKit
import Combine

// MARK: - Appearance
extension View {
    func cornerRadius(_ radius: CGFloat) -> some View {
        return clipShape(.rect(cornerRadius: radius, style: .continuous))
    }
}

// MARK: - Navigation
extension View {
    func handleNavigationActions<T: Destination>(
        _ actionPublisher: AnyPublisher<RoutingAction<T>, Never>,
        router: NavigationRouter<T>
    ) -> some View {
        self.onReceive(actionPublisher) { action in
            switch action {
            case .push(let destination):
                router.navigate(to: destination)
            case .pop:
                router.navigateBack()
            case .popToRoot:
                router.navigateToRoot()
            }
        }
    }
}
