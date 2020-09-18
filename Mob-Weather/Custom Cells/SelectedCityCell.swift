//
//  SelectedCityCell.swift
//  Mob-Weather
//
//  Created by Burak Donat on 18.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit
import SnapKit

class SelectedCityCell: UITableViewCell {
    
    private let view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    private let weatherImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(systemName: "heart.fill")
        return iv
    }()
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Eskisehir"
        label.font = label.font.withSize(14)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "22/07/2020"
        label.textColor = .purplyBlue
        label.font = label.font.withSize(12)
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "35°C"
        label.textAlignment = .center
        label.textColor = .purplyBlue
        label.font = label.font.withSize(30)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: "selectedCityCell")
        self.backgroundColor = .paleGrey
        addSubview(view)
        view.snp.makeConstraints { (make) in
            make.leading.top.equalTo(16)
            make.trailing.bottom.equalTo(-16)
            make.height.equalTo(55)
        }
        
        let doubleStack = UIStackView(arrangedSubviews: [cityLabel, dateLabel])
        doubleStack.axis = .vertical
        doubleStack.distribution = .fillEqually
        doubleStack.spacing = 2
        
        let tripleStack = UIStackView(arrangedSubviews: [weatherImageView, doubleStack])
        tripleStack.axis = .horizontal
        tripleStack.distribution = .fillEqually
        tripleStack.spacing = 5
        
        let stack = UIStackView(arrangedSubviews: [tripleStack, temperatureLabel])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0
        view.addSubview(stack)
        stack.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView(name: String, temp: Double, condID: Int) {
        cityLabel.text = name
        temperatureLabel.text = "\(Int(temp))" + "°C"
        let image = setWeatherImage(conditionId: condID)
        weatherImageView.image = UIImage(systemName: image)
    }
    
    func setWeatherImage(conditionId: Int) -> String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
