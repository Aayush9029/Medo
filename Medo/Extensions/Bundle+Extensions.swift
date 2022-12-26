//
//  Bundle+Extension.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import Foundation

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}
