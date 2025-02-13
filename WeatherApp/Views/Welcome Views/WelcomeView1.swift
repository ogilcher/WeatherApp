//
//  WelcomeView1.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import SwiftUI

struct WelcomeView1: View {
    var body: some View {
        NavigationStack {
            VStack (spacing: 40) {
                Image(systemName: "cloud.sun.rain.fill")
                    .font(.system(size: 100))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(
                        .white,
                        .yellow,
                        .blue
                    )
                
                VStack (spacing: 10) {
                    Text("Weather")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.yellow)
                    Text("Forecast App.")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("This app has a bunch of features including most of the weather data that you would expect to see on a weather app, such as the current temperature, humidity, wind speed, and more.")
                    .padding(.horizontal, 15)
                    .font(.system(size: 15))
                    .foregroundStyle(.white)
                
                NavigationLink(
                    destination: ContentView().navigationBarBackButtonHidden(),
                    label: {
                        Text("Get Started")
                            .font(.system(size: 20, weight: .bold))
                        
                            .frame(width: 200, height: 45)
                            .background(.yellow)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                )
                
                HStack {
                    Text("Powered by")
                    Link("WeatherAPI.com", destination: URL(string: "https://www.weatherapi.com/")!)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.cobaltBlue.gradient)
        }
    }
}

#Preview {
    WelcomeView1()
}
