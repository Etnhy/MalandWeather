//
//  MainViewController.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 26.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var dataWeather = [WeatherModel]()

    lazy var textFieldCountries: ContainerViews = {
        var view = ContainerViews()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imager: UIImageView = {
       var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "weather.jpeg")
        image.contentMode = .scaleToFill
        return image
    }()
    

    
    lazy var lableContry: UILabel = {
       var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Название города"
        lable.textAlignment = .center
        return lable
        
    }()
    
    lazy var stackInfo: Lables = {
        var view = Lables()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        addSubviews()
        setCons()
        fetch()
        
    }
    
    
    private func configureView() {
        self.view.backgroundColor = .gray
    }
    
    private func addSubviews() {
        view.addSubview(imager)
        view.addSubview(textFieldCountries)
        view.addSubview(lableContry)
        view.addSubview(stackInfo)

    }
    private func setCons() {
        NSLayoutConstraint.activate([
            textFieldCountries.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textFieldCountries.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textFieldCountries.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textFieldCountries.heightAnchor.constraint(equalToConstant: 64),
            
            lableContry.topAnchor.constraint(equalTo: textFieldCountries.bottomAnchor, constant: 70),
            lableContry.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lableContry.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stackInfo.topAnchor.constraint(equalTo: lableContry.bottomAnchor,constant: 44),
            stackInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            imager.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            imager.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            imager.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imager.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

    }

}

extension MainViewController {
    func fetch() {
        dataWeather = []
        APIManager.shared.fetchCurrentWeather { result in
            switch result {
                case .success(let response):
                    print(response)
                    DispatchQueue.main.async {
                        self.stackInfo.tempLable.text = String("\(response.main.temp - 273).C")
                        self.lableContry.text = response.name
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}


    


    

