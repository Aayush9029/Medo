//
//  URLParser.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-20.
//

import Foundation
import OSLog

struct TaskModel {
    let title: String
    let priority: String
}

enum URLParser {
    private static let logger = Logger(subsystem: "com.aayush.opensource.Medo", category: "URLParser")

    static func parse(_ url: String) -> [UrlParseType: TaskModel?]? {
        guard let components = URLComponents(string: url), let host = components.host else {
            return nil
        }
        logger.debug("Parsing deeplink host: \(host, privacy: .public)")

        if let urlType = UrlParseType(rawValue: host) {
            logger.debug("Matched deeplink type: \(urlType.rawValue, privacy: .public)")

            switch urlType {
            case .addTask:
                guard let query = components.queryItems else {
                    return nil
                }
                return [UrlParseType.addTask: URLParser.getTask(items: query)]
            case .floatSmall:
                return [UrlParseType.floatSmall: nil]
            case .floatMedium:
                return [UrlParseType.floatMedium: nil]
            case .floatLarge:
                return [UrlParseType.floatLarge: nil]
            }
        }
        return nil
    }

    static func getTask(items: [URLQueryItem]) -> TaskModel {
        var title = "Untitled"
        var priority: String = Priority.low.rawValue

        if let titleQuery = items.first {
            if titleQuery.name == "title" {
                title = titleQuery.value ?? "Untitled"
            }
        }
        if let priorityQuery = items.last {
            if priorityQuery.name == "p" {
                if let rPriority = Priority(rawValue: priorityQuery.value ?? "3") {
                    priority = rPriority.rawValue
                }
            }
        }
        return TaskModel(title: title, priority: priority)
    }
}
