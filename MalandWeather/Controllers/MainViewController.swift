//
//  MainViewController.swift
//  MalandWeather
//
//  Created by Евгений Маглена on 26.01.2022.
//

import UIKit
import Nuke



class MainViewController: UIViewController {
    
    var dataWeather = [WeatherModel]()
    var countryWeather: String = ""


    
    lazy var dropDownList: DropDownView = {
        var view = DropDownView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imager: UIImageView = {
       var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "weather.jpeg")
        image.contentMode = .scaleToFill
        return image
    }()
    

    
    lazy var lableContry: UILabel = {
       var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 0

        lable.attributedText = NSAttributedString(string: "Город",attributes: [NSAttributedString.Key.font : UIFont.LetoTextSansDefect(ofSize: 32)])
        lable.textAlignment = .center
        lable.textColor = .black
        return lable
        
    }()
    
    let stackInfo: Lables = {
        var view = Lables()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let refreshButton: UIButton  = {
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
//        fetch()  //
        fetchTwo() // get with Alamofire
        
        dropDownList.dropDown.didSelect { selectedText, index, id in
            self.countryWeather = selectedText
        }
        
    }
    
    //MARK: -  Settings
    
    private func configureView() {
        self.view.backgroundColor = .gray
    }
    
    private func addSubviews() {
        view.addSubview(imager)
        view.addSubview(dropDownList)
        view.addSubview(lableContry)
        view.addSubview(stackInfo)
        view.addSubview(refreshButton)

    }
    //MARK: - Constraints
    private func setCons() {
        NSLayoutConstraint.activate([
            dropDownList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            dropDownList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dropDownList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            dropDownList.heightAnchor.constraint(equalToConstant: 64),
            
            lableContry.topAnchor.constraint(equalTo: dropDownList.bottomAnchor, constant: 70),
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
            
            refreshButton.topAnchor.constraint(equalTo: dropDownList.bottomAnchor, constant: 20),
            refreshButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
        ])
    }
    
    //MARK: - Actions
    @objc func tapButton(_ sender: UIButton) {
//        fetch()
        fetchTwo()
    }
    //MARK: - start fetch


}
//MARK: - FETCH

extension MainViewController {
    func fetch() {

        APIManager.shared.fetchCurrentWeather(country: countryWeather) { result in
            switch result {
                case .success(let response):
                    print(response)
                    DispatchQueue.main.async {
                        self.lableContry.text = response.name
                        self.stackInfo.lablesToViews[0].text = "Максимальная: " + String(response.main.temp_max - 273).formattedMinMax(1) + " ℃"
                        self.stackInfo.lablesToViews[1].text = "Минимальная: " + String(response.main.temp_min - 273).formattedMinMax(1) + " ℃"
                        self.stackInfo.lablesToViews[2].text = "Ощущается как: " + String(response.main.feels_like - 273).formattedMinMax(0) + " ℃"
//                        self.stackInfo.lablesOnSecondView[0].text = "\(response.weather[0].description)"
                        
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func fetchTwo() {
        APIManager.shared.getWeather(city: countryWeather) { result in
            switch result {
                case .success(let response):
                    print(response)
                    DispatchQueue.main.async {
                        self.lableContry.text = "В городе \(response.name!) сейчас \(response.weather[0].description) "
                        self.stackInfo.lablesToViews[0].text = "Максимальная: " + String(response.main.temp_max - 273).formattedMinMax(1) + " ℃"
                        self.stackInfo.lablesToViews[1].text = "Минимальная: " + String(response.main.temp_min - 273).formattedMinMax(1) + " ℃"
                        self.stackInfo.lablesToViews[2].text = "Ощущается как: " + String(response.main.feels_like - 273).formattedMinMax(0) + " ℃"
                        self.stackInfo.lablesOnSecondView[0].text = "\(response.weather[0].description)"


                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
        
}


    


    

