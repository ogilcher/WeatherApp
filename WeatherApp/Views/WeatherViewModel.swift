//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import Foundation
import SwiftUI

@MainActor
final class WeatherViewModel : ObservableObject {
    @AppStorage("preferredMetric") var preferredMetric : String = "imperial"
    @Published var weatherData: Weather?
    @Published var isLoading = true
    @Published var condition = ""
    @Published var temperature = 0.0
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "API KEY FETCH FAILED"
    
    func fetchData(for city: City) async {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city.getFormattedName())"
        print("Fetching data from: \(urlString)")
        
        guard let downloadedWeather: Weather = await WebManager().downloadData(fromURL: urlString) else {
            print("Failed to fetch weather data")
            return
        }
        
        weatherData = downloadedWeather
        condition = WeatherManager.shared.getPrettyCondition(for: weatherData?.current.condition.text ?? "No condition")
        temperature = preferredMetric == "imperial" ? weatherData?.current.temp_f ?? 0.0 : weatherData?.current.temp_c ?? 0.0
        
        isLoading = false
    }
}
