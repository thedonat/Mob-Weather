//
//  CityViewModel.swift
//  Mob-Weather
//
//  Created by Burak Donat on 18.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

protocol CityViewModelProtocol: class {
    func didGetSelectedCities()
}

 class CityListViewModel {
    weak var delegate: CityViewModelProtocol?
    var defaults = UserDefaults.standard
    var cityResults: [SelectedCityModel] = []
    
    var numberOfRows: Int {
        return cityResults.count
    }
    
    func cellForRow(at index: Int) -> CityViewModel {
        let selectedCities = self.cityResults[index]
        return CityViewModel(city: selectedCities)
    }
    
     func printSelecteds() {
        cityResults = []
        if let selectedCities = defaults.value(forKey: "Y") as? [String] {
            print(selectedCities)
            for selectedCity in selectedCities {
                let englishSelected = selectedCity.replacingOccurrences(of: "ı", with: "i")
                let url = "https://api.openweathermap.org/data/2.5/forecast?appid=8cdf5e25d598a184fdbbc995c02aa44f&units=metric&q=\(englishSelected)"
                WebService().performRequest(url: url) { (result: SelectedCityModel) in
                    self.cityResults.append(result)
                    self.delegate?.didGetSelectedCities()
                }
            }
            self.delegate?.didGetSelectedCities()
        } else {
            self.delegate?.didGetSelectedCities()
        }
    }
}

struct CityViewModel {
    let city: SelectedCityModel
    var temp: Double {
        return city.list[0].main.temp
    }
    var name: String {
        return city.city.name.components(separatedBy: " ").first ?? ""
    }
    var condID: Int {
        return city.list[0].weather[0].id
    }
}

