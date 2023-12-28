//
//  WeatherService.swift
//  GoodWeather_SwiftUI
//
//  Created by Jorge de Carvalho on 18/12/23.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=484091f3d921f05f8be7c41f6b6ebd6e&units=metric") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
