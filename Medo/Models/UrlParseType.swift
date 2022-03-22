//
//  UrlParseType.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-22.
//

import Foundation

enum UrlParseType: String {
    case addTask = "add-task"
    case floatSmall = "float-small"
    case floatMedium = "float-medium"
    case floatLarge = "float-large"
}


//MARK: Float sizes

enum FloatType: CGFloat {
    case floatSmall = 140
    case floatMedium = 264
    case floatLarge = 360
}
