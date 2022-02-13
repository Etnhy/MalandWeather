//
//  Lables.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 29.01.2022.
//

import UIKit

class Lables: UIView {
    
    var dataWeather: [Weather]?
    
    private let namesViews = ["Максимальная:","Минимальная:","Ощущается как:"]
    private let windOther = ["0","1","2"]
    
 
    
    lazy var firstView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.backgroundColor = .white.withAlphaComponent(0.8)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.8).cgColor
        return view
    }()
    
    lazy var seconViewJoke: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.backgroundColor = .white.withAlphaComponent(0.8)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.8).cgColor
        return view
    }()
    
 
    
    
    lazy var lablesToViews: [UILabel] = {
        var lables = [UILabel]()
        for labl in namesViews {
            var view = UILabel()
            view.text = labl
            view.textColor = .black
            
            lables.append(view)
        }
        return lables
    }()
    
    
    
    lazy var stackLables: UIStackView = {
        var stack = UIStackView(arrangedSubviews: lablesToViews)
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 20
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 30, left: 8, bottom: 8, right: 8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        return stack
    }()
    
    lazy var temperatureLabel: UILabel = {
       var lable = UILabel()
        lable.attributedText = NSAttributedString(string: "Температура",
                                                  attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .medium)])
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    lazy var imageCaats: UIImageView = {
       var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 14
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
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

    
    
    private func addSub() {
//        self.addSubview(stackView)
        self.addSubview(firstView)
        self.addSubview(seconViewJoke)
        
        firstView.addSubview(stackLables)
        firstView.addSubview(temperatureLabel)
        
        self.seconViewJoke.addSubview(imageCaats)
        

    }
    
    
    
    private func setCons() {
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: self.topAnchor),
            firstView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            firstView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            firstView.heightAnchor.constraint(equalToConstant: 220),
            
            seconViewJoke.topAnchor.constraint(equalTo: firstView.bottomAnchor,constant: 22),
            seconViewJoke.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            seconViewJoke.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            seconViewJoke.heightAnchor.constraint(equalToConstant: 220),
        ])
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: firstView.topAnchor),
            temperatureLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageCaats.topAnchor.constraint(equalTo: seconViewJoke.topAnchor),
            imageCaats.bottomAnchor.constraint(equalTo: seconViewJoke.bottomAnchor),
            imageCaats.leadingAnchor.constraint(equalTo: seconViewJoke.leadingAnchor),
            imageCaats.trailingAnchor.constraint(equalTo: seconViewJoke.trailingAnchor),

        ])
        NSLayoutConstraint.activate([
            stackLables.topAnchor.constraint(equalTo: self.topAnchor),
            stackLables.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackLables.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackLables.trailingAnchor.constraint(equalTo: self.trailingAnchor),

        ])
        
    }
    
    
}
