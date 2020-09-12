//
//  NewCityViewModel.swift
//  Mob-Weather
//
//  Created by Burak Donat on 11.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

protocol NewCityListViewModelProtocol: class {
    func getCityList()
}

class NewCityListViewModel {
    weak var delegate : NewCityListViewModelProtocol?
    var contactArray: [City?] = []
    var contactSection: [String] = []
    var contactDictionary = [String: [String]]()
    
    var numberOfRows: Int {
        return contactArray.count
    }
    func cellForRow(at index: Int) -> NewCityViewModel? {
        if let city = self.contactArray[index] {
            return NewCityViewModel(city: city)
        }
        return nil
    }
    
    func getSections(){
        for city in self.contactArray {
            if let name = city?.name {
                let key = "\(name[name.startIndex])"
                print(key)
                let lower = key.lowercased()
                if var value = contactDictionary[lower] {
                    value.append(name)
                    print(value)
                    contactDictionary[lower] = value
                } else {
                    contactDictionary[lower] = [name]
                }
            }
        }
        print(contactSection)
        contactSection = [String](contactDictionary.keys)
        contactSection = contactSection.sorted()
    }
    
    func getData() {
        let cityURL = "https://weathercase-99549.firebaseio.com/.json"
        WebService().performRequest(url: cityURL) { (city: [City]) in
            self.contactArray = city
            self.getSections()
            self.delegate?.getCityList()
        }
    }
}

class NewCityViewModel {
    let city: City
    init(city: City) {
        self.city = city
    }
    var name: String {
        return city.name
    }
    var id: Int {
        return city.id
    }
}
