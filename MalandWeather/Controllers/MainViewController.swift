//
//  MainViewController.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 26.01.2022.
//

import UIKit



class MainViewController: UIViewController {
    
    var dataWeather = [WeatherModel]()
    var countryWeather: String = ""

    
//    lazy var textFieldCountries: ContainerViews = {
//        var view = ContainerViews()
//
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    lazy var textFieldCountries: DropDownView = {
        var view = DropDownView()
        
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
        lable.attributedText = NSAttributedString(string: "Город",attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 36, weight: .bold)])
        lable.textAlignment = .center
        return lable
        
    }()
    
    lazy var stackInfo: Lables = {
        var view = Lables()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var refreshButton: UIButton  = {
       var button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "Клац", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24, weight: .bold)]), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        addSubviews()
        setCons()
        fetch()
        
        textFieldCountries.dropDown.didSelect { selectedText, index, id in
            self.countryWeather = selectedText
        }
        
    }
    
    
    private func configureView() {
        self.view.backgroundColor = .gray
    }
    
    private func addSubviews() {
        view.addSubview(imager)
        view.addSubview(textFieldCountries)
        view.addSubview(lableContry)
        view.addSubview(stackInfo)
        view.addSubview(refreshButton)

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
            stackInfo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -94),
            
            imager.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            imager.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            imager.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imager.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            refreshButton.topAnchor.constraint(equalTo: textFieldCountries.topAnchor, constant: 70),
            refreshButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])

    }
    
    //MARK: - Actions
    @objc func tapButton(_ sender: UIButton) {
        let con = Country().country
        print(con)
        fetch()
    }

}

extension MainViewController {
    func fetch() {

        APIManager.shared.fetchCurrentWeather(country: countryWeather) { result in
            switch result {
                case .success(let response):
                    print(response)
                    DispatchQueue.main.async {
                        self.lableContry.text = response.name
                        self.stackInfo.lablesToViews[0].text = "Максимальная: \(response.main.temp_max - 273).C"
                        self.stackInfo.lablesToViews[1].text = "Минимальная: \(response.main.temp_min - 273).C"
                        self.stackInfo.lablesToViews[2].text = "Ощущается как: \(response.main.feels_like - 273).C"
                        
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
        
}


    


    

