//
//  LocalizeManager.swift
//  DiscoveryApp
//
//  Created by Lauv Edward on 04/07/2021.
//

import UIKit

class LocalizeManager {

    // MARK: - Properties
    static let shared = LocalizeManager()
    private var appbundle = Bundle.main
    
    func setSelectedLanguage(lang: String) {
        guard let langPath = Bundle.main.path(forResource: lang, ofType: "lproj") else {
            appbundle = Bundle.main
            return
        }
        appbundle = Bundle(path: langPath)!
    }
    
    func stringForKey(key: String) -> String {
        return appbundle.localizedString(forKey: key, value: "", table: nil)
    }
}
