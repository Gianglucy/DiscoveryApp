//
//  UserPreferences.swift
//  DiscoveryApp
//
//  Created by Lauv Edward on 04/07/2021.
//

import Foundation

enum AppLanguage: String {
    case english = "en"
    case vietnamese = "vi"
    
    var text: String {
        switch self {
        case .english:
            return "English"
        case .vietnamese:
            return "Vietnamese"
        }
    }
}

class UserPreferences {
    
    // MARK: - Singleton
    static let shared = UserPreferences()
    let userDefaultDataStore = UserDefaultsDataStore()
    var appLanguage: AppLanguage = .english
    // MARK: - Properties
    struct UserPreferencesKeys {
        static var APP_LANGUAGE_KEY: String {
            return APP_LANGUAGE
        }
    }
    
    func saveAppLanguage() {
        DispatchQueue.global(qos: .background).async(flags: .barrier) { [unowned self] in
            // Save setting data to specific user
            self.userDefaultDataStore.save(forKey: UserPreferencesKeys.APP_LANGUAGE_KEY, value: self.appLanguage.rawValue)
        }
    }
    
    func isSelectAppLanguage() -> Bool {
        // Load app language from UserDefault
        if self.userDefaultDataStore.fetch(type: String.self, forKey: UserPreferencesKeys.APP_LANGUAGE_KEY) != nil {
            return true
        } else {
            return false
        }
    }
}
