//
//  UrlParseType.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-22.
//

import Foundation

enum UrlParseType: String {
    case addTask = "add-task"
    case floatSmall = "show-small"
    case floatMedium = "show-medium"
    case floatLarge = "show-large"
}


//MARK: Float sizes

enum FloatType: CGFloat {
    case floatSmall = 140
    case floatMedium = 264
    case floatLarge = 360
}
