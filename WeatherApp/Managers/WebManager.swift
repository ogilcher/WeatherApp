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
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

final class WebManager {
    func downloadData<T: Codable>(fromURL: String) async -> T? {
        do {
            guard let url = URL(string: fromURL) else { throw NetworkError.badURL }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            
            // Decode the data into the expected model (Weather here)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("An error occurred downloading the data: \(error.localizedDescription)")
        }
        
        return nil
    }
}
