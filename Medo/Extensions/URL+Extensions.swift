//
//  URL+Extension.swift
//   Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import Foundation

extension URL {
    var isDeeplink: Bool {
        return scheme == "medo"
    }
}
