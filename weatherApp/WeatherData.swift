//
//  WeatherData.swift
//  weatherApp
//
//  Created by Austreberto Gomez on 4/8/21.
//

import SwiftUI

struct WeatherData: Decodable {
    var city: CityData
    var list: [DayWeatherData]
}

struct CityData: Decodable {
    var name: String
}


struct DayWeatherData: Decodable {
    var main: TempetureData
}

struct TempetureData: Decodable {
    var temp: Double
}
