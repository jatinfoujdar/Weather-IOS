import SwiftUI

struct CityDetailsView: View {
    var cityName: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(cityName)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack {
                Text("9°C")
                    .font(.system(size: 50))
                    .fontWeight(.semibold)
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
            }

            Text("Cloudy")
                .font(.title2)
                .foregroundColor(.gray)

            Text("Expect scattered clouds throughout the day with temperatures ranging from 8°C to 12°C.")
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
    CityDetailsView(cityName: "Jaipur")
}
