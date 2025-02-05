import SwiftUI

struct CityList: View {
    @State private var cities: [WeatherModel] = []

    var body: some View {
        NavigationView {
            List(cities) { city in
                NavigationLink(destination: CityDetailsView(city: city)) {
                    HStack {
                        Text(city.name)
                        Text(String(format: "%.1f°C", city.temperature))
                            .padding()
                        
                        Image(systemName: "cloud.fill")
                        Spacer()
                        
                        Image(systemName: city.id.uuidString.hasSuffix("0") ? "star.fill" : "star")
                            .foregroundColor(city.id.uuidString.hasSuffix("0") ? .yellow : .gray)
                    }
                }
                .padding()
            }
            .navigationTitle("Cities")
            .onAppear {
                // Fetch cities from API
                fetchCities()
            }
        }
    }

    private func fetchCities() {
        // Implement API request to fetch cities
        // For demonstration purposes, we'll use a mock API
        let mockCities: [WeatherModel] = [
            WeatherModel(name: "New York", temperature: 22.0, condition: "Sunny", description: "Clear skies"),
            WeatherModel(name: "Los Angeles", temperature: 28.0, condition: "Cloudy", description: "Partly cloudy"),
            WeatherModel(name: "Chicago", temperature: 18.0, condition: "Rainy", description: "Light rain showers")
        ]
        cities = mockCities
    }
}


#Preview {
    CityList()
}
