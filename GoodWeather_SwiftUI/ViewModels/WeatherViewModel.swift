//
//  WeatherViewModel.swift
//  GoodWeather_SwiftUI
//
//  Created by Jorge de Carvalho on 26/12/23.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherService!
    @Published var weather = Weather()
    var cityName: String = ""

    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }

    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f °C", temp)
//            return String("\(temp) °C")
        } else {
            return ""
        }
    }

    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }

    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }

    private func fetchWeather(by city: String) {
        self.weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
    
}
