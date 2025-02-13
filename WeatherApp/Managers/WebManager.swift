//
//  WebManager.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case invalidRequest
    case invalidResponse
    case failedToDecodeResponse
}

final class WebManager {
    static let shared = WebManager()
    init() {}
    
    func downloadData<T: Codable>(fromURL: String, expectedObject: T.Type) async throws -> T {
        // Convert the provided String URL to a usable Swift URL Obj
        guard let url = URL(string: fromURL) else {
            throw NetworkError.badURL
        }
        
        // Get data and response from a URLSession (could have errors or bad data which is handled below)
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check URLSession response and ensure it was valid, otherwise throw custom invalidResponse error
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        // Create and decode from snake case to camel case (ex: is_day -> isDay) for use in Codable
        // otherwise, throw custom failedToDecodeResponse error
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(expectedObject.self, from: data) // If this fails, then property names from codable dosen't match
        } catch {
            throw NetworkError.failedToDecodeResponse
        }
    }
}
