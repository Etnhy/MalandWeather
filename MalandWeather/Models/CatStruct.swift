//
//  CatStruct.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 13.02.2022.
//

import Foundation
import UIKit

struct AllCats: Codable {
    let id: String
    let url: String
    let width: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case id, url, width, height
    }
}


