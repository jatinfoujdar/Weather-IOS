import Foundation
import Combine

class WeatherApi: ObservableObject {
    @Published var cities: [WeatherModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let ApiUrl = "YOUR_API_URL_HERE"
    
    func fetchCities() async {
        isLoading = true
        errorMessage = nil
        
        do {
            guard let url = URL(string: ApiUrl) else {
                errorMessage = "Invalid URL"
                isLoading = false
                return
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                errorMessage = "Failed to fetch data. Status code: \((response as? HTTPURLResponse)?.statusCode ?? 0)"
                isLoading = false
                return
            }
            
            let decodedCities = try JSONDecoder().decode([WeatherModel].self, from: data)
            
            DispatchQueue.main.async {
                self.cities = decodedCities
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Error fetching data: \(error.localizedDescription)"
                self.isLoading = false
            }
        }
    }
}
