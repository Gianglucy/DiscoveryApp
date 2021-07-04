//
//  UserDefaultsDataStore.swift
//  Zooo Demo
//
//  Created by Nhat Nguyen on 6/6/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

extension UserDefaults {
    func removeAll() {
        dictionaryRepresentation().forEach { removeObject(forKey: $0.key) }
    }
}

final class UserDefaultsDataStore {

    func fetch<T>(type: T.Type, forKey: String) -> T? {
        switch type.self {
        case is Data.Type:
            guard let value = UserDefaults.standard.data(forKey: forKey) as? T  else { return nil }
            return value
        case is String.Type:
            guard let value = UserDefaults.standard.string(forKey: forKey) as? T  else { return nil }
            return value
        case is [String].Type:
            guard let values = UserDefaults.standard.object(forKey: forKey) as? T  else { return nil }
            return values
        case is Bool.Type:
            guard let values = UserDefaults.standard.bool(forKey: forKey) as? T else { return nil }
            return values
        case is Int.Type:
            guard let values = UserDefaults.standard.integer(forKey: forKey) as? T else { return nil }
            return values
        default:
            return nil
        }
    }

    func save<T>(forKey: String, value: T) {
        UserDefaults.standard.set(value, forKey: forKey)
    }

    func delete(forKey: String) {
        UserDefaults.standard.removeObject(forKey: forKey)
    }

    func deleteAll() {
        UserDefaults.standard.removeAll()
    }

}
