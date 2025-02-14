//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import Foundation
import SwiftUI

final class WeatherManager {
    static let shared = WeatherManager()
    init() {}
    
    func getPrettyCondition(for condition: String) -> String {
        switch (condition) {
        case "Sunny": return "Sunny"
        case "Clear": return "Clear"
        case "Partly cloudy": return "Partly cloudy"
        case "Cloudy": return "Cloudy"
        case "Overcast": return "Mostly cloudy"
        case "Mist": return "Mist"
        case "Patchy rain possible": return "Possible rain"
        case "Patchy snow possible": return "Possible snow"
        case "Patchy sleet possible": return "Possible sleet"
        case "Patchy freezing drizzle possible": return "Possible freezing drizzle"
        case "Thundery outbreaks possible": return "Possible Thunderstorms"
        case "Blowing snow": return "Blowing snow"
        case "Blizzard": return "Blizzard"
        case "Fog": return "Fog"
        case "Freezing fog": return "Freezing fog"
        case "Patchy light drizzle": return "Possible Light drizzle"
        case "Light drizzle": return "Light drizzle"
        case "Freezing drizzle": return "Freezing drizzle"
        case "Heavy freezing drizzle": return "Heavy freezing drizzle"
        case "Patchy light rain": return "Patchy light rain"
        case "Light rain": return "Light rain"
        case "Moderate rain at times": return "Moderate rain at times"
        case "Moderate rain": return "Moderate rain"
        case "Heavy rain at times": return "Heavy rain at times"
        case "Heavy rain": return "Heavy rain"
        case "Light freezing rain": return "Light freezing rain"
        case "Moderate or heavy freezing rain": return "Moderate or heavy freezing rain"
        case "Light sleet": return "Light sleet"
        case "Moderate or heavy sleet": return "Moderate or heavy sleet"
        case "Patchy light snow": return "Patchy light snow"
        case "Light snow": return "Light snow"
        case "Patchy moderate snow": return "Patchy moderate snow"
        case "Moderate snow": return "Moderate snow"
        case "Patchy heavy snow": return "Patchy heavy snow"
        case "Heavy snow": return "Heavy snow"
        case "Ice pellets": return "Ice pellets"
        case "Light rain shower": return "Light rain shower"
        case "Moderate or heavy rain shower": return "Moderate or heavy rain shower"
        case "Torrential rain shower": return "Torrential rain shower"
        case "Light sleet showers": return "Light sleet showers"
        case "Moderate or heavy sleet showers": return "Moderate or heavy sleet showers"
        case "Light snow showers": return "Light snow showers"
        case "Moderate or heavy snow showers": return "Moderate or heavy snow showers"
        case "Light showers of ice pellets": return "Light showers of ice pellets"
        case "Moderate or heavy showers of ice pellets": return "Moderate or heavy showers of ice pellets"
        case "Patchy light rain with thunder": return "Patchy light rain with thunder"
        case "Moderate or heavy rain with thunder": return "Moderate or heavy rain with thunder"
        case "Patchy light snow with thunder": return "Patchy light snow with thunder"
        case "Moderate or heavy snow with thunder": return "Moderate or heavy snow with thunder"
        default: return condition
        }
    }
    
    func getIcon(for condition: String) -> Image {
        switch (condition) {
        case "Sunny": return Image(systemName: "sun.max.fill")
        case "Clear": return Image(systemName: "moon.stars.fill")
        case "Partly cloudy": return Image(systemName: "cloud.sun.fill")
        case "Cloudy": return Image(systemName: "cloud.fill")
        case "Overcast": return Image(systemName: "smoke.fill")
        case "Mist": return Image(systemName: "cloud.fog.fill")
        case "Patchy rain possible": return Image(systemName: "cloud.drizzle.fill")
        case "Patchy snow possible": return Image(systemName: "cloud.snow")
        case "Patchy sleet possible": return Image(systemName: "cloud.sleet")
        case "Patchy freezing drizzle possible": return Image(systemName: "cloud.hail")
        case "Thundery outbreaks possible": return Image(systemName: "cloud.bolt")
        case "Blowing snow": return Image(systemName: "wind.snow")
        case "Blizzard": return Image(systemName: "cloud.snow.circle.fill")
        case "Fog": return Image(systemName: "cloud.fog.fill")
        case "Freezing fog": return Image(systemName: "snowflake")
        case "Patchy light drizzle": return Image(systemName: "cloud.drizzle")
        case "Light drizzle": return Image(systemName: "cloud.drizzle.fill")
        case "Freezing drizzle": return Image(systemName: "cloud.sleet.fill")
        case "Heavy freezing drizzle": return Image(systemName: "cloud.sleet.circle.fill")
        case "Patchy light rain": return Image(systemName: "cloud.rain")
        case "Light rain": return Image(systemName: "cloud.rain.fill")
        case "Moderate rain at times": return Image(systemName: "cloud.heavyrain")
        case "Moderate rain": return Image(systemName: "cloud.heavyrain.fill")
        case "Heavy rain at times": return Image(systemName: "cloud.heavyrain.circle")
        case "Heavy rain": return Image(systemName: "cloud.heavyrain.circle.fill")
        case "Light freezing rain": return Image(systemName: "cloud.sleet.fill")
        case "Moderate or heavy freezing rain": return Image(systemName: "cloud.sleet.circle.fill")
        case "Light sleet": return Image(systemName: "cloud.sleet.fill")
        case "Moderate or heavy sleet": return Image(systemName: "cloud.sleet.circle.fill")
        case "Patchy light snow": return Image(systemName: "cloud.snow")
        case "Light snow": return Image(systemName: "cloud.snow.fill")
        case "Patchy moderate snow": return Image(systemName: "cloud.snow")
        case "Moderate snow": return Image(systemName: "cloud.snow.fill")
        case "Patchy heavy snow": return Image(systemName: "snowflake")
        case "Heavy snow": return Image(systemName: "cloud.snow.circle.fill")
        case "Ice pellets": return Image(systemName: "cloud.hail.fill")
        case "Light rain shower": return Image(systemName: "cloud.sun.rain")
        case "Moderate or heavy rain shower": return Image(systemName: "cloud.sun.rain.fill")
        case "Torrential rain shower": return Image(systemName: "cloud.heavyrain.fill")
        case "Light sleet showers": return Image(systemName: "cloud.sleet")
        case "Moderate or heavy sleet showers": return Image(systemName: "cloud.sleet.fill")
        case "Light snow showers": return Image(systemName: "cloud.snow")
        case "Moderate or heavy snow showers": return Image(systemName: "cloud.snow.fill")
        case "Light showers of ice pellets": return Image(systemName: "cloud.hail")
        case "Moderate or heavy showers of ice pellets": return Image(systemName: "cloud.hail.fill")
        case "Patchy light rain with thunder": return Image(systemName: "cloud.bolt.rain")
        case "Moderate or heavy rain with thunder": return Image(systemName: "cloud.bolt.rain.fill")
        case "Patchy light snow with thunder": return Image(systemName: "cloud.snow")
        case "Moderate or heavy snow with thunder": return Image(systemName: "cloud.snow.fill")
        default: return Image(systemName: "questionmark.circle")
        }
    }
    
    func getBackgroundColors(for condition: String) -> [Color] {
        switch condition {
        case "Sunny":
            return [Color.yellow, Color.orange]
        case "Clear":
            return [Color.blue, Color.purple]
        case "Partly cloudy":
            return [Color.blue, Color.gray]
        case "Cloudy":
            return [Color.gray, Color.white]
        case "Overcast":
            return [Color.gray, Color.white]
        case "Mist":
            return [Color.gray.opacity(0.6), Color.white.opacity(0.8)]
        case "Patchy rain possible":
            return [Color.blue.opacity(0.5), Color.gray]
        case "Patchy snow possible":
            return [Color.white, Color.blue.opacity(0.5)]
        case "Patchy sleet possible":
            return [Color.blue.opacity(0.7), Color.gray]
        case "Patchy freezing drizzle possible":
            return [Color.blue.opacity(0.8), Color.white]
        case "Thundery outbreaks possible":
            return [Color.gray, Color.yellow]
        case "Blowing snow":
            return [Color.white, Color.blue.opacity(0.6)]
        case "Blizzard":
            return [Color.white, Color.gray]
        case "Fog":
            return [Color.gray.opacity(0.7), Color.white]
        case "Freezing fog":
            return [Color.blue.opacity(0.6), Color.white]
        case "Patchy light drizzle":
            return [Color.blue.opacity(0.6), Color.gray]
        case "Light drizzle":
            return [Color.blue.opacity(0.7), Color.gray]
        case "Freezing drizzle":
            return [Color.blue.opacity(0.7), Color.white]
        case "Heavy freezing drizzle":
            return [Color.blue, Color.white]
        case "Patchy light rain":
            return [Color.blue.opacity(0.6), Color.gray]
        case "Light rain":
            return [Color.blue.opacity(0.8), Color.gray]
        case "Moderate rain at times":
            return [Color.blue, Color.gray]
        case "Moderate rain":
            return [Color.blue, Color.gray.opacity(0.9)]
        case "Heavy rain at times":
            return [Color.blue, Color.black.opacity(0.8)]
        case "Heavy rain":
            return [Color.blue, Color.black]
        case "Light freezing rain":
            return [Color.blue.opacity(0.7), Color.gray]
        case "Moderate or heavy freezing rain":
            return [Color.blue.opacity(0.8), Color.white]
        case "Light sleet":
            return [Color.blue.opacity(0.7), Color.gray]
        case "Moderate or heavy sleet":
            return [Color.blue.opacity(0.8), Color.white]
        case "Patchy light snow":
            return [Color.white, Color.blue.opacity(0.6)]
        case "Light snow":
            return [Color.white, Color.blue.opacity(0.7)]
        case "Patchy moderate snow":
            return [Color.white, Color.blue.opacity(0.6)]
        case "Moderate snow":
            return [Color.white, Color.blue.opacity(0.8)]
        case "Patchy heavy snow":
            return [Color.white, Color.blue]
        case "Heavy snow":
            return [Color.white, Color.blue]
        case "Ice pellets":
            return [Color.blue, Color.white]
        case "Light rain shower":
            return [Color.blue.opacity(0.6), Color.gray]
        case "Moderate or heavy rain shower":
            return [Color.blue, Color.gray]
        case "Torrential rain shower":
            return [Color.blue, Color.gray]
        case "Light sleet showers":
            return [Color.blue.opacity(0.7), Color.gray]
        case "Moderate or heavy sleet showers":
            return [Color.blue.opacity(0.8), Color.white]
        case "Light snow showers":
            return [Color.white, Color.blue.opacity(0.6)]
        case "Moderate or heavy snow showers":
            return [Color.white, Color.blue.opacity(0.7)]
        case "Light showers of ice pellets":
            return [Color.blue, Color.white]
        case "Moderate or heavy showers of ice pellets":
            return [Color.blue, Color.white]
        case "Patchy light rain with thunder":
            return [Color.gray, Color.yellow]
        case "Moderate or heavy rain with thunder":
            return [Color.gray, Color.yellow]
        case "Patchy light snow with thunder":
            return [Color.blue, Color.yellow]
        case "Moderate or heavy snow with thunder":
            return [Color.blue, Color.orange]
        default:
            return [Color.gray, Color.white]
        }
    }
}
