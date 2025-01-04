import SwiftUI

struct CityList: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<5, id: \.self) { index in
                HStack {
                    Text("City \(index + 1)")
                    Text("\(10 + index)°C")
                        .padding()

                    Image(systemName: "cloud.fill")
                    Spacer()

                    Image(systemName: index % 2 == 0 ? "star.fill" : "star")
                        .foregroundColor(index % 2 == 0 ? .yellow : .gray)
                }
                .padding()
            }
        }
        .font(.title2)
        .fontWeight(.bold)
    }
}

#Preview {
    CityList()
}
