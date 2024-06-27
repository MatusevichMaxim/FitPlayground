//
//  UserDefaults+Extension.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/27/24.
//

import Foundation

extension UserDefaults {
    func set<T>(_ value: T, forKey key: UserDefaultsKey) {
        set(value, forKey: key.rawValue)
    }
    
    func value<T>(forKey key: UserDefaultsKey) -> T? {
        return value(forKey: key.rawValue) as? T
    }
}
