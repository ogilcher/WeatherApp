//
//  ContentView.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor : Color = .white
    @AppStorage("selectedCity") private var selectedCity : String?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(selectedCity ?? "")
                    .foregroundStyle(.blue)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor.gradient)
            
            .onAppear {
                if selectedCity == nil {
                    selectedCity = "New York"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
