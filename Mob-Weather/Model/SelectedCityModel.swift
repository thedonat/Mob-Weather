//
//  SelectedCityModel.swift
//  Mob-Weather
//
//  Created by Burak Donat on 18.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

struct SelectedCityModel: Codable {
    let list: [List]
    let city: SelectedCity
}

struct List: Codable {
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct SelectedCity: Codable {
    let name: String
}

struct Weather: Codable {
    let description: String
    let id: Int
}
