//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import Foundation

@MainActor
class WeatherViewModel : ObservableObject {
    @Published var weatherData : Weather?
    @Published var isLoading = true
    @Published var condition = ""
    @Published var temperature = 0.0
    
    let apiKey = "ff3305f26d894469a6e04215251302"
    
    func fetchData(for city: City) async {
        guard let downloadedWeather: [Weather] = await WebManager().downloadData(
            fromURL: "api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city.getFormattedName())"
        ) else {return}
        weatherData = downloadedWeather.first
        
        
        
        isLoading = false
    }
}
