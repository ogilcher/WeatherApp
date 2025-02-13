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
    
    init() {
        
    }
    
    func fetchData(for city: City) async {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city.getFormattedName())"
        print("Fetching data from: \(urlString)")
        
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
            condition = WeatherManager.shared.getPrettyCondition(for: weatherData!.current.condition.text)
            temperature = preferredMetric == "Imperial" ? weatherData!.current.tempF : weatherData!.current.tempC
        }
        
        isLoading = false
    }
}
