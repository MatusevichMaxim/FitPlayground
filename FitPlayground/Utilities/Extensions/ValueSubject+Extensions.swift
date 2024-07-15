//
//  ValueSubject+Extensions.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/12/24.
//

import SwiftUI

extension ValueSubject {
    func toBinding() -> Binding<Output> {
        Binding<Output>(
            get: { self.value },
            set: { self.send($0) }
        )
    }
}
