//
//  ContentView.swift
//  GoodWeather_SwiftUI
//
//  Created by Jorge de Carvalho on 18/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel

    init() {
        self.weatherVM = WeatherViewModel(weatherService: WeatherService())
    }

    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter city name", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }
            .font(.custom("Arial", size: 50))
            .padding()
            .fixedSize()

            Text(self.weatherVM.temperature)
                .font(.custom("Arial", size: 100))
                .offset(y: 100)
                .foregroundColor(Color.white)
                .padding()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
