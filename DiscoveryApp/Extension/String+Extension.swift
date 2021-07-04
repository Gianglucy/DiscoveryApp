//
//  String+Extension.swift
//  DiscoveryApp
//
//  Created by Lauv Edward on 04/07/2021.
//

import UIKit

extension String {
    // Return localized string
    var localized: String {
        return LocalizeManager.shared.stringForKey(key: self)
    }
}
