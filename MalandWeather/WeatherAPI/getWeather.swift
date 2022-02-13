//
//  getWeather.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 29.01.2022.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    
    let apik = "https://api.openweathermap.org/data/2.5/weather?q=Kyiv&appid=9e64db94a738a9d0398f267a443b079c"

    
    //MARK: - AF get
   public func getWeather(city: String = "Kyiv",comppletion: @escaping (Result<WeatherModel, AFError>)-> Void) {
        let mainUrl = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=9e64db94a738a9d0398f267a443b079c&lang=ru"

        guard let url = URL(string: mainUrl) else {return}
        
        AF.request(url, method: .get,encoding: JSONEncoding.default, headers: ["Accept":"application/json"], requestModifier: {
            urlRequest in
            urlRequest.timeoutInterval = 10
        }).validate(statusCode: 200..<201).responseJSON { (responseJSON) in
            switch responseJSON.result {
                case .success(let response):
                    print(response)
                    guard let json = try? JSONDecoder().decode(WeatherModel.self, from: responseJSON.data!) else {return}
                    comppletion(.success(json))
                case .failure(let error):
                    comppletion(.failure(error))
            }
        }
 
    }
}

