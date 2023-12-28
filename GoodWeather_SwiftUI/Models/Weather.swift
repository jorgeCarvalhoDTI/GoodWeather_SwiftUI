//
//  Weather.swift
//  GoodWeather_SwiftUI
//
//  Created by Jorge de Carvalho on 18/12/23.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
