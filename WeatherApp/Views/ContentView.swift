//
//  ContentView.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    @State private var backgroundColor : Color = .white
    @AppStorage("selectedCity") private var selectedCity : String?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(selectedCity!)
                Text(viewModel.condition)
            }
            .foregroundStyle(.black)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor.gradient)
            
            .onAppear {
                selectedCity = "San Francisco"
//                if selectedCity == nil {
//                    selectedCity = "San Francisco"
//                }
                Task {
                    await viewModel.fetchData(for: City.getCity(for: selectedCity!)!)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
