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
    let windOther = ["dima","poshel","nahui"]
    
    
    
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
            view.text = labl
            
            lables.append(view)
        }
        return lables
    }()
    lazy var lablesOnSecondView: [UILabel] = {
        var lables = [UILabel]()
        for labl in windOther {
            var view = UILabel()
            view.text = labl
            lables.append(view)
        }
        return lables
    }()
    
    lazy var stackSecond: UIStackView = {
       var stack = UIStackView(arrangedSubviews: lablesOnSecondView)
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 30
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        return stack
    }()
    
    lazy var stackLables: UIStackView = {
       var stack = UIStackView(arrangedSubviews: lablesToViews)
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 30
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        return stack
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSub()
        addPackLables()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCons()
        addPackLables()
    }
    
    
    //MARK: -  Setups
    func addPackLables() {
        lablesView[0].addSubview(stackLables)
        lablesView[1].addSubview(stackSecond)
    }
    
    
    func addSub() {
        self.addSubview(stackView)
    }
    
    
    
    func setCons() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
//            stackLables.topAnchor.constraint(equalTo: self.topAnchor),
//            stackLables.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            stackLables.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            stackLables.trailingAnchor.constraint(equalTo: self.trailingAnchor),

        ])
        
    }
    
    
}
