//
//  VersionModel.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import Foundation

struct VersionModel: Codable {
    let title: String
    let published: String
    let version: String
    let build: Int
    let downloadlink: String

    static let exampleVersionModel = VersionModel(
        title: "New Release",
        published: "2022-03-23",
        version: "0.0",
        build: 0,
        downloadlink: "https://www.apple.com"
    )
}
