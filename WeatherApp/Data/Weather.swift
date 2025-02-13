//
//  Weather.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import Foundation

struct Weather : Codable, Identifiable {
    var id: UUID = UUID()
    let location : Location
    let current : CurrentWeather
}

struct Location : Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tzId: String
    let localtimeEpoch: Int
    let localtime: String
}

struct CurrentWeather : Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let isDay: Int
    let condition: Condition
    let windMph: Double
    let windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMb: Double
    let pressureIn: Double
    let precipMm: Double
    let precipIn: Double
    let humidity: Int
    let cloud: Int
    let feelslikeC: Double
    let feelslikeF: Double
    let windchillC: Double
    let windchillF: Double
    let headindexC: Double
    let headindexF: Double
    let dewpointC: Double
    let dewpointF: Double
    let visKm: Double
    let visMiles: Double
    let uv: Double
    let gustMph: Double
    let gustKph: Double
}

struct Condition: Codable {
    let text: String
    let icon: String
    let code: Int
}
