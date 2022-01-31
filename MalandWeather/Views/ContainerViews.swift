//
//  ContainerViews.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 29.01.2022.
//

import UIKit

class ContainerViews: UIView {

    lazy var countryNames: UITextField = {
       var field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.attributedPlaceholder = NSAttributedString(string: "Введите название города", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.67)])
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.keyboardType = .default
        return field
    }()
    lazy var alphaView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray.withAlphaComponent(0.65)
        return view
    }()
    



    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSub()
//        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
        
        
    }
    
    private func addSub() {
        self.addSubview(alphaView)
        self.addSubview(countryNames)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            alphaView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            alphaView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            alphaView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            alphaView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            
            
            countryNames.topAnchor.constraint(equalTo: self.topAnchor),
            countryNames.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            countryNames.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countryNames.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
            

        ])
    }

}


    
    
    
    
    

