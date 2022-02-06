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
    
    
    //MARK: - get 1
   public func fetchCurrentWeather(country: String,completion: @escaping (Result<WeatherModel, Error>)->()) {
                
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
                    guard let response = response as? [String:Any] else {return}
                    print(response)
                    guard let json = try? JSONDecoder().decode(WeatherModel.self, from: responseJSON.data!) else {return}
                    comppletion(.success(json))
                case .failure(let error):
                    print(error.localizedDescription)
                    comppletion(.failure(error))
            }
        }
 
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
