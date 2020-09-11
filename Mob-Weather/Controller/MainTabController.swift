//
//  MainTabControllerViewController.swift
//  Mob-Weather
//
//  Created by Burak Donat on 10.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    func configureViewControllers() {
        let weather = WeatherController()
        let nav1 =  templateNavigationController(image: UIImage(named: "hava"), rootViewController: weather)
        let city = CityController()
        let nav2 =  templateNavigationController(image: UIImage(named: "sehir"), rootViewController: city)
        
        viewControllers = [nav1, nav2]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        //the function for settting up the view controllers for the tab bar and embedding each of them into navigation controller
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
}
