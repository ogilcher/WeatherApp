//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import SwiftUI
import SwiftData

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(
            for: City.self
        )
    }
}
