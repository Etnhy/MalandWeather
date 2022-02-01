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
    
    
    let test = "https://jsonplaceholder.typicode.com/todos/1"
    let apik = "https://api.openweathermap.org/data/2.5/weather?q=Kyiv&appid=9e64db94a738a9d0398f267a443b079c"
    let twoest = "pro.openweathermap.org/data/2.5/forecast/hourly?q=Киев&appid=9e64db94a738a9d0398f267a443b079c"
  
    
    func fetchCurrentWeather(completion: @escaping (Result<WeatherModel, Error>)->()) {
            
        guard let url = URL(string: apik) else {return}
        
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let currentWeather = try JSONDecoder().decode(WeatherModel.self, from: data)
                completion(.success(currentWeather))
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
