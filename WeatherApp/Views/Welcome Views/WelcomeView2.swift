//
//  WelcomeView2.swift
//  WeatherApp
//
//  Created by Oliver Gilcher on 2/12/25.
//

import SwiftUI

import SwiftUI

class CityViewModel: ObservableObject {
    @Environment(\.modelContext) var context
    
    @Published var cities: [City] = []
    @Published var filteredCities: [City] = []
    @Published var selectedCities: [City] = []
    @Published var searchText: String = ""

    init() {
        loadCities()
    }

    func loadCities() {
        cities = City.getAllCities()
        filterCities()
    }
    
    func savePreferences() async {
        for city in selectedCities {
            context.insert(city)
        }
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }

    func filterCities() {
        DispatchQueue.global(qos: .userInitiated).async {
            let filtered = self.cities.filter { city in
                let isSelected = self.selectedCities.contains(where: { $0.id == city.id })
                let matchesSearch = self.searchText.isEmpty || city.name.lowercased().hasPrefix(self.searchText.lowercased())
                return !isSelected && matchesSearch
            }

            DispatchQueue.main.async {
                self.filteredCities = filtered
            }
        }
    }
}


struct WelcomeView2: View {
    @StateObject private var viewModel = CityViewModel()
    @State private var hasReachedLimit: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                VStack(spacing: 15) {
                    Text("Select up to 10 Cities")
                        .font(.system(size: 30, weight: .bold))
                    Text("that you would like to have displayed, you can change your preferences later.")
                        .font(.system(size: 15))
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)

                // Search bar
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $viewModel.searchText)
                            .onChange(of: viewModel.searchText) {
                                viewModel.filterCities()
                            }
                        Button(action: {
                            viewModel.searchText = ""
                            viewModel.filterCities()
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(viewModel.searchText.isEmpty ? 0 : 1)
                        }
                    }
                    .padding()
                    .frame(width: 350, height: 40)
                    .background(.ultraThickMaterial)
                    .clipShape(.rect(cornerRadius: 15))
                }

                Text(hasReachedLimit ? "You have reached your limit of 10 Cities" : "")
                    .foregroundStyle(.red)

                List {
                    Text("Selected Cities")
                    ForEach(viewModel.selectedCities, id: \.id) { city in
                        CityCard(viewModel: viewModel, hasReachedLimit: $hasReachedLimit, isSelected: true, city: city)
                    }
                    Text("Remaining")
                    ForEach(viewModel.filteredCities, id: \.id) { city in
                        CityCard(viewModel: viewModel, hasReachedLimit: $hasReachedLimit, isSelected: false, city: city)
                    }
                }
                .background(.clear)

                NavigationLink(
                    destination: ContentView().navigationBarBackButtonHidden(),
                    label: {
                        Text("Finish")
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: 200, height: 45)
                            .background(.yellow)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                )
                .simultaneousGesture(TapGesture()
                    .onEnded{
                        Task {
                            await viewModel.savePreferences()
                        }
                    }
                )
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.cobaltBlue.gradient)
        }
    }
}


struct CityCard : View {
    @StateObject var viewModel : CityViewModel
    @Binding var hasReachedLimit : Bool
    var isSelected : Bool
    var city : City
    
    var body : some View {
        if isSelected {
            Button (
                action: {
                    if viewModel.selectedCities.count > 9 {
                        hasReachedLimit = false
                    }
                    viewModel.selectedCities.removeAll { $0 == city}
                    viewModel.filterCities()
                }, label: {
                    HStack {
                        Image(systemName: "minus")
                            .foregroundStyle(.red)
                        Spacer()
                        Text(city.name)
                        Spacer()
                        Image(systemName: "line.3.horizontal")
                    }
                }
            )
            .font(.system(size: 18, weight: .semibold))
            
        } else {
            Button (
                action: {
                    if viewModel.selectedCities.count < 9 {
                        viewModel.selectedCities.append(city)
                        viewModel.filterCities()
                    } else {
                        hasReachedLimit = true
                    }
                }, label: {
                    HStack {
                        Image(systemName: "plus")
                            .foregroundStyle(.green)
                        Spacer()
                        Text(city.name)
                        Spacer()
                    }
                }
            )
        }
    }
}

#Preview {
    WelcomeView2()
}
