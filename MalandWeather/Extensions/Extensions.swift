//
//  Extensions.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 30.01.2022.
//

import Foundation

//MARK: - String Extension
extension String {
    func formattedMinMax(_ digitsCount: Int = 2) -> String {
        if let double = Double(self) {
            let stringDouble = String(format: "%.\(digitsCount)f", double)
            return stringDouble
        }
        return self
    }
    
}

//MARK: -  ARRAY Extension

extension Array {
    func findIndexes(arr: [String]) -> [Int] {
        let indexes = arr.enumerated().filter {
            $0.element == $0.element
        }.map{$0.offset}
        
        print(indexes)
        return indexes
    }
}
