//
//  VersionCheckViewModel.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import Foundation
import OSLog
import SwiftUI

@MainActor
final class VersionCheckViewModel: ObservableObject {
    @Published var latestVersion: VersionModel = .exampleVersionModel
    private let logger = Logger(subsystem: "com.aayush.opensource.Medo", category: "VersionCheckViewModel")

    enum UpdateFetcherError: Error, LocalizedError {
        case invalidURL
        case jsonDecodingError

        var errorDescription: String? {
            switch self {
            case .invalidURL:
                return "Version check URL is invalid."
            case .jsonDecodingError:
                return "Version response could not be decoded."
            }
        }
    }

    func checkForUpdates() async {
        do {
            latestVersion = try await fetchRemoteVersion()
        } catch {
            logger.error("Could not check for updates: \(error.localizedDescription, privacy: .public)")
        }
    }

    nonisolated func fetchRemoteVersion() async throws -> VersionModel {
        guard let url = URL(string: Constants.versionCheckURL) else {
            throw UpdateFetcherError.invalidURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(VersionModel.self, from: data)
            return result
        } catch {
            throw UpdateFetcherError.jsonDecodingError
        }
    }
}
