//
//  CityController.swift
//  Mob-Weather
//
//  Created by Burak Donat on 10.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class CityController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        navigationItem.title = "Sehirler"
        view.backgroundColor = .paleGrey
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .purple
    }
    
    @objc func addButtonTapped() {
        let newCityController = NewCityController()
        navigationController?.pushViewController(newCityController, animated: true)
    }
}
