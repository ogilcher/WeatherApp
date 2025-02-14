//
//  ContentView.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    @State private var backgroundColor = [Color.white, Color.gray]
    @AppStorage("selectedCity") private var selectedCity : String?
    private var currentDate = Date()
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 40) {
                VStack (spacing: 5) {
                    Text(selectedCity!)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.cobaltBlue)
                    Text(currentDate.formatted(.dateTime.weekday().day().month()))
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.thickMaterial)
                }
                
                viewModel.image
                    .font(.system(size: 150))
                    .foregroundStyle(.white)
                    
                
                VStack (spacing: 5) {
                    Text(viewModel.condition)
                        .foregroundStyle(.cobaltBlue.opacity(0.4))
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(viewModel.temperature)°")
                        .foregroundStyle(.cobaltBlue)
                        .font(.system(size: 50, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(LinearGradient(colors: viewModel.backgroundColor, startPoint: .top, endPoint: .bottom))
            
            .onAppear {
                selectedCity = "Dallas"
                Task {
                    await viewModel.fetchData(for: City.getCity(for: selectedCity!)!)
                }
                backgroundColor = viewModel.backgroundColor
            }
        }
        .sheet(
            isPresented: .constant(true),
            content: {
                WeatherDetailsView(weatherData: $viewModel.weatherData)
                    .interactiveDismissDisabled()
                    .presentationDetents([.medium, .large, .fraction(0.8), .height(300)])
                    .presentationCornerRadius(50)
                    .presentationBackgroundInteraction(.enabled)
            }
        )
    }
}

#Preview {
    ContentView()
}
