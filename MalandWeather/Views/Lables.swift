//
//  Lables.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 29.01.2022.
//

import UIKit

class Lables: UIView {
    
    var dataWeather: [Weather]?
    
    let namesViews = ["Температура","Остальное","Ветер"]
//    let lablesNames

    
    lazy var lablesView: [UIView] = {
       var views = [UIView]()
        for viewName in namesViews.enumerated() {
            var view = UIView()
            view.backgroundColor = .white.withAlphaComponent(0.77)
            view.layer.cornerRadius = 14
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.black.withAlphaComponent(0.8).cgColor
            views.append(view)
        }
        
        return views
    }()
    
    lazy var stackView: UIStackView = {
       var stack = UIStackView(arrangedSubviews: lablesView)
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillProportionally
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var lablesToViews: [UILabel] = {
        var lables = [UILabel]()
        for labl in namesViews {
            var view = UILabel()
            view.backgroundColor = .blue.withAlphaComponent(0.2)
            view.text = labl
            lables.append(view)
        }
        return lables
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
    func addPackLables() {
        
    }
    func addSub() {
        self.addSubview(stackView)
    }
    func setupView() {
        
        
    }
    
    func setCons() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
            
                
        ])
        
    }
    
    


    
}
