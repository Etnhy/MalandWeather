//
//  DropDownView.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 04.02.2022.
//

import UIKit
import iOSDropDown

class DropDownView: UIView {
    
    let uaCountry = ["Kyiv", "Odessa","Dnipropetrovsk", "Kharkiv","KrivoyRog","Cherkasy",
                     "Chernihiv","Chernivtsi","Ivano-Frankivsk","Kherson",
                     "Khmelnytskyi","Kirovohrad","Luhansk","Lviv","Mykolaiv","Poltava","Rivne","Sumy"]
    
    lazy var dropDown: DropDown = {
        var drop = DropDown()
        drop.optionArray = uaCountry
//        drop.setAttributedMarkedText(NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24, weight: .medium), selectedRange: uaCountry)
//        drop.optionIds = [1,23,54,22]
        drop.optionIds = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
        drop.optionImageArray = ["👩🏻‍🦳","🙊","🥞"]
        drop.backgroundColor = .black.withAlphaComponent(0.2)
        drop.cornerRadius = 12
        drop.isSearchEnable = true
        drop.checkMarkEnabled = false
//        drop.rowHeight = 50
        drop.arrowSize = 12
        drop.selectedRowColor = .blue.withAlphaComponent(0.3)
        drop.rowBackgroundColor = .white.withAlphaComponent(0.3)
        drop.translatesAutoresizingMaskIntoConstraints = false
        return drop
        }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dropDown)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            dropDown.topAnchor.constraint(equalTo: self.topAnchor),
            dropDown.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            dropDown.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dropDown.trailingAnchor.constraint(equalTo: self.trailingAnchor),

        ])
    }
    
}