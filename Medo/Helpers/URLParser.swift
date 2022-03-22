//
//  URLParser.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-20.
//

import Foundation

struct TaskModel {
    let title: String
    let priority: String
}



class URLParser {

    static func parse(_ url: String) -> [UrlParseType: TaskModel?]? {

        guard let host = URLComponents(string: url)?.host else {
            return nil
        }
        print("Host: \(host)")
        if let urlType = UrlParseType(rawValue: host) {
            print("UrlParseType: \(urlType)")

            switch urlType {
            case .addTask:
                guard let  query = URLComponents(string: url)?.queryItems else { return nil }
                return [UrlParseType.addTask: URLParser.get_task(items: query)]
            case .floatSmall:
                return [UrlParseType.floatSmall : nil]
            case .floatMedium:
                return [UrlParseType.floatMedium : nil]
            case .floatLarge:
                return [UrlParseType.floatLarge : nil]
            }
        }
        return nil
    }

    static func get_task(items: [URLQueryItem]) -> TaskModel {
        var title: String = "Untitled"
        var priority: String = Priority.low.rawValue

        if let titleQuery = items.first {
            if titleQuery.name == "title" {
                title = titleQuery.value ?? "Untitled"
            }
        }
        if let priorityQuery = items.last {
            if priorityQuery.name == "p" {
                if let r_priority = Priority(rawValue: priorityQuery.value ?? "3") {
                    priority = r_priority.rawValue
                }
            }
        }
        return TaskModel(title: title, priority: priority)
    }

}
