import SwiftUI

struct CityList: View {
    var cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"]
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                ForEach(0..<cities.count, id: \.self) { index in
                    NavigationLink(destination: CityDetailsView(cityName: cities[index])) {
                        HStack {
                            Text(cities[index])
                            Text("\(10 + index)°C")
                                .padding()
                            
                            Image(systemName: "cloud.fill")
                            Spacer()
                            
                            Image(systemName: index % 2 == 0 ? "star.fill" : "star")
                                .foregroundColor(index % 2 == 0 ? .yellow : .gray)
                        }
                    }
                    .padding()
                }
            }
            .font(.title2)
            .fontWeight(.bold)
            .navigationTitle("City")
        }
     }
   }

#Preview {
    CityList()
}
