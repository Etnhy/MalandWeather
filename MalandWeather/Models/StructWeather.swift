//
//  StructWeather.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 29.01.2022.
//

import Foundation

struct Country {
    var country = "Kyiv"
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Float
    let humidity: Float
}
struct Sys: Codable {
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}
struct WeatherModel: Codable {
    let weather: [Weather]
    let main: Main
    let sys: Sys
    let name: String?
    let dt: Int
    let timezone: Int?
    let dt_txt: String?
}




    
    enum CodingKeys: String, CodingKey {
        case main = "main", description, id, lon, lat, weather, coord
    }
 

//{"coord":{"lon":30.5167,"lat":50.4333},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"base":"stations","main":{"temp":273.02,"feels_like":273.02,"temp_min":272.2,"temp_max":273.55,"pressure":1008,"humidity":66},"visibility":10000,"wind":{"speed":0.45,"deg":94,"gust":4.02},"clouds":{"all":100},"dt":1643472279,"sys":{"type":2,"id":2003742,"country":"UA","sunrise":1643434645,"sunset":1643467466},"timezone":7200,"id":703448,"name":"Kyiv","cod":200}



