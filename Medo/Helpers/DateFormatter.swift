//
//  DateFormatter.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-12-26.
//

import SwiftUI

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    formatter.timeStyle = .medium
    return formatter
}()
