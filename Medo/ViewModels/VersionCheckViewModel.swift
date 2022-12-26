//
//  VersionCheckViewModel.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import SwiftUI

class VersionCheckViewModel: ObservableObject {
    @Published var latestVersion: VersionModel = .exampleVersionModel

    enum UpdateFetcherError: Error {
        case invalidURL
        case jsonDecodingError
    }

    @MainActor
    func checkForUpdates() async {
        do {
            latestVersion = try await fetchRemoteVersion()
        } catch {
            print(error, error.localizedDescription)
        }
    }

    func fetchRemoteVersion() async throws -> VersionModel {
        guard let url = URL(string: Constants.versionCheckURL) else {
            throw UpdateFetcherError.invalidURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            let result = try JSONDecoder().decode(VersionModel.self, from: data)
            return result
        } catch {
            throw UpdateFetcherError.jsonDecodingError
        }
    }
}
