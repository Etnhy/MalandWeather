//
//  getJoke.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 12.02.2022.
//

import Foundation
import Alamofire


class GetCatJoke {
    static let shared = GetCatJoke()
    let baseUrl = "https://api.thecatapi.com/v1/images/search"

    
    
    func getCat(parameters: [String:Any]? = nil,completion: @escaping (Result<[AllCats], AFError>) -> ()) {
        let mainUrl = "https://api.thecatapi.com/v1/images/search?format=json?api_key=1325c8d7-7caf-4dbb-a284-ea4702539442"
        guard let url = URL(string: mainUrl) else {return}
        AF.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: ["Accept": "application/json"], interceptor: nil, requestModifier: {
            urlRequest in
            urlRequest.timeoutInterval = 10
        }).validate(statusCode: 200..<201).responseDecodable(of: [AllCats].self) { result in
            switch result.result {
                case .success(let succes):
                    completion(.success(succes))
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
            }
        }
    }

    
}
