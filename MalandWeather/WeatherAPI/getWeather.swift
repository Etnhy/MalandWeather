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
    
//    var gorod = Country()

    let apik = "https://api.openweathermap.org/data/2.5/weather?q=Kyiv&appid=9e64db94a738a9d0398f267a443b079c"
    
    func fetchCurrentWeather(country: String,completion: @escaping (Result<WeatherModel, Error>)->()) {
                
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q=\(country)&appid=9e64db94a738a9d0398f267a443b079c&lang=ru"
        
        guard let url = URL(string: baseUrl) else {return}
        
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

//extension APIManager: CoutryChanged {
//    func setCountry(country: UITextField) {
//        self.country.country = country.text!
//        print(self.country.country)
//    }
//    
//    
//    
//    
//}
