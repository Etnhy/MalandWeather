//
//  Lables.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 29.01.2022.
//

import UIKit

class Lables: UIView {
    
    var dataWeather: [Weather]?
    
    lazy var nameLabel: UILabel = {                     // name country
       var name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .white
        name.text = "Город"
        return name
    }()
    lazy var sunsetLabel: UILabel = {               // sunset
       var sun = UILabel()
        sun.translatesAutoresizingMaskIntoConstraints = false
        sun.textColor = .white
        sun.text = "сан"
        return sun
    }()
    lazy var tempLable: UILabel = {                 // temperature
       var temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .white
        temp.text = "temp"
        return temp
    }()
    lazy var windSpeedLabel: UILabel = {                // wind speed
       var wind = UILabel()
        wind.translatesAutoresizingMaskIntoConstraints = false
        wind.textColor = .white
        wind.text = "wind"
        return wind
    }()
    lazy var mainLabel: UILabel = {                 // cloud or not
       var main = UILabel()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.textColor = .white
        main.text = "main"
        return main
    }()
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSub()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setCons()
    }
    //MARK: -  Setups
    func addSub() {
        self.addSubview(nameLabel)
        self.addSubview(sunsetLabel)
        self.addSubview(tempLable)
        self.addSubview(windSpeedLabel)
        self.addSubview(mainLabel)
    }
    
    func setCons() {
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            
            sunsetLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            sunsetLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            
            tempLable.topAnchor.constraint(equalTo: sunsetLabel.bottomAnchor,constant: 16),
            tempLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            windSpeedLabel.topAnchor.constraint(equalTo: tempLable.bottomAnchor,constant: 16),
            windSpeedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            mainLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor,constant: 16),
            mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
            
        ])
        
    }
    
    


    
}
