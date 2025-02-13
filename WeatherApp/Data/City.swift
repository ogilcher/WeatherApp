//
//  City.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import SwiftUI
import SwiftData

@Model
final class City: Identifiable {
    var id: UUID = UUID()
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getFormattedName() -> String {
        return name.replacingOccurrences(of: " ", with: "-")
    }
    
    static func getAllCities() -> [City] {
        return [
            City(name: "New York"), City(name: "Los Angeles"), City(name: "Chicago"), City(name: "Houston"),
            City(name: "Phoenix"), City(name: "Philadelphia"), City(name: "San Antonio"), City(name: "San Diego"),
            City(name: "Dallas"), City(name: "San Jose"), City(name: "Austin"), City(name: "Jacksonville"),
            City(name: "Fort Worth"), City(name: "Columbus"), City(name: "Charlotte"), City(name: "Indianapolis"),
            City(name: "San Francisco"), City(name: "Seattle"), City(name: "Denver"), City(name: "Washington"),
            City(name: "Boston"), City(name: "El Paso"), City(name: "Nashville"), City(name: "Detroit"),
            City(name: "Oklahoma City"), City(name: "Portland"), City(name: "Las Vegas"), City(name: "Memphis"),
            City(name: "Louisville"), City(name: "Baltimore"), City(name: "Milwaukee"), City(name: "Albuquerque"),
            City(name: "Tucson"), City(name: "Fresno"), City(name: "Sacramento"), City(name: "Kansas City"),
            City(name: "Mesa"), City(name: "Atlanta"), City(name: "Omaha"), City(name: "Colorado Springs"),
            City(name: "Raleigh"), City(name: "Miami"), City(name: "Long Beach"), City(name: "Virginia Beach"),
            City(name: "Oakland"), City(name: "Minneapolis"), City(name: "Tulsa"), City(name: "Arlington"),
            City(name: "Tampa"), City(name: "New Orleans"), City(name: "Wichita"), City(name: "Cleveland"),
            City(name: "Bakersfield"), City(name: "Aurora"), City(name: "Anaheim"), City(name: "Honolulu"),
            City(name: "Santa Ana"), City(name: "Riverside"), City(name: "Corpus Christi"), City(name: "Lexington"),
            
            // Major cities from each U.S. state
            City(name: "Anchorage"), City(name: "Birmingham"), City(name: "Little Rock"), City(name: "Hartford"),
            City(name: "Dover"), City(name: "Boise"), City(name: "Springfield"), City(name: "Des Moines"),
            City(name: "Frankfort"), City(name: "Baton Rouge"), City(name: "Augusta"), City(name: "Annapolis"),
            City(name: "Lansing"), City(name: "Saint Paul"), City(name: "Jackson"), City(name: "Jefferson City"),
            City(name: "Helena"), City(name: "Lincoln"), City(name: "Carson City"), City(name: "Concord"),
            City(name: "Trenton"), City(name: "Santa Fe"), City(name: "Albany"), City(name: "Bismarck"),
            City(name: "Columbus"), City(name: "Salem"), City(name: "Harrisburg"), City(name: "Providence"),
            City(name: "Columbia"), City(name: "Pierre"), City(name: "Montpelier"), City(name: "Richmond"),
            City(name: "Charleston"), City(name: "Cheyenne"),

            // More international cities to reach 200
            City(name: "Toronto"), City(name: "Vancouver"), City(name: "Montreal"), City(name: "Mexico City"),
            City(name: "Buenos Aires"), City(name: "Sao Paulo"), City(name: "Rio de Janeiro"), City(name: "Lima"),
            City(name: "Bogotá"), City(name: "London"), City(name: "Paris"), City(name: "Berlin"),
            City(name: "Madrid"), City(name: "Rome"), City(name: "Athens"), City(name: "Vienna"),
            City(name: "Prague"), City(name: "Warsaw"), City(name: "Amsterdam"), City(name: "Brussels"),
            City(name: "Zurich"), City(name: "Istanbul"), City(name: "Moscow"), City(name: "Dubai"),
            City(name: "Beijing"), City(name: "Shanghai"), City(name: "Tokyo"), City(name: "Seoul"),
            City(name: "Bangkok"), City(name: "Hong Kong"), City(name: "Singapore"), City(name: "Jakarta"),
            City(name: "New Delhi"), City(name: "Mumbai"), City(name: "Sydney"), City(name: "Melbourne"),
            City(name: "Cape Town"), City(name: "Johannesburg"), City(name: "Cairo")
        ]
    }
}

extension City {
    static func getCity(for name: String) -> City? {
        return getAllCities().first { $0.name == name }
    }
}
