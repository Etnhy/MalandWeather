//
//  ExtensionFonts.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 06.02.2022.
//

import Foundation
import UIKit

extension UIFont {
    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    static func LetoTextSansDefect(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "LetoTextSansDefect", size: size)
    }
    
    static func Vakiar(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "mr_Vokiar", size: size)
    }
}
