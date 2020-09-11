//
//  NewCityController.swift
//  Mob-Weather
//
//  Created by Burak Donat on 11.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class NewCityController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .paleGrey
        let backButton = UIImage(named: "geri")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
    }
}
