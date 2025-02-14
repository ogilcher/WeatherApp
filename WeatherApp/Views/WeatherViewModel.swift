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
    
    @Published var image = Image(systemName: "questionmark.circle")
    @Published var condition = ""
    @Published var temperature = 0
    
    @Published var backgroundColor = [Color.white, Color.gray]
    @Published var foregroundColors = [Color.white]
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "API KEY FETCH FAILED"
    
    init() {
        
    }
    
    func fetchData(for city: City) async {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city.getFormattedName())"
        
        do {
            weatherData = try await WebManager.shared.downloadData(fromURL: urlString, expectedObject: Weather.self)
        } catch NetworkError.badURL {
            print("bad url")
        } catch NetworkError.invalidRequest {
            print("bad request")
        } catch NetworkError.invalidResponse {
            print("bad response")
        } catch NetworkError.failedToDecodeResponse {
            print ("bad decoding")
        } catch {
            print ("unhandled error")
        }
         
        if (weatherData != nil) {
            image = WeatherManager.shared.getIcon(for: weatherData!.current.condition.text)
            condition = WeatherManager.shared.getPrettyCondition(for: weatherData!.current.condition.text)
            temperature = preferredMetric == "Imperial" ? Int(weatherData!.current.tempC) : Int(weatherData!.current.tempF)
            backgroundColor = WeatherManager.shared.getBackgroundColors(for: weatherData!.current.condition.text)
        }
        
        isLoading = false
    }
}
