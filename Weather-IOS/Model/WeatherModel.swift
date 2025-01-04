import Foundation
import SwiftUI

struct WeatherModel: Identifiable {
    var id = UUID()
       var name: String
       var temperature: Int
       var isFavorite: Bool
       var weatherCondition: String
       var description: String
}


