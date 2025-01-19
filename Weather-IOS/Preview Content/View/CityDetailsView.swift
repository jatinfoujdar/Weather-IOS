import SwiftUI

struct CityDetailsView: View {
    let city: WeatherModel

    var body: some View {
        VStack(spacing: 20) {
            Text(city.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack {
                Text("\(city.temperature)°C")
                    .font(.system(size: 50))
                    .fontWeight(.semibold)
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
            }

            Text(city.condition)
                .font(.title2)
                .foregroundColor(.gray)

            Text(city.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Weather Details")
    }
}

#Preview {
    CityDetailsView(city: WeatherModel(name: "Jaipur", temperature: 25.0, condition: "Sunny", description: "Clear skies"))
}
