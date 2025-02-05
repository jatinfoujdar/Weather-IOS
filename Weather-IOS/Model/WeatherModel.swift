import Foundation


struct WeatherModel: Codable, Identifiable {
    var id = UUID()
    let name: String
    let temperature: Double
    let condition: String
    let description: String
    var favourite : Bool
}



