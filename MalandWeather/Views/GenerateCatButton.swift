//
//  GenerateCatButton.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 13.02.2022.
//

import UIKit

class GenerateCatButton: UIView {

    let generateCatButton: UIButton = {
        var button = UIButton(type: .system)
        button.setAttributedTitle(NSAttributedString(string: "Кота !",attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24, weight: .bold),NSAttributedString.Key.foregroundColor : UIColor.black]), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
   private func setupView() {
        self.addSubview(generateCatButton)
        
    }
   private func setConstraints() {
        NSLayoutConstraint.activate([
            generateCatButton.topAnchor.constraint(equalTo: self.topAnchor),
            generateCatButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            generateCatButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            generateCatButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),

        ])
    }
    
}
