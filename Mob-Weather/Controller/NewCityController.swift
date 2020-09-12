//
//  NewCityController.swift
//  Mob-Weather
//
//  Created by Burak Donat on 11.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CityCell"

class NewCityController: UITableViewController {
    
    let newCityListVM: NewCityListViewModel = NewCityListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getData()
    }
    
    func getData() {
        newCityListVM.delegate = self
        newCityListVM.getData()
    }
    
    func configureUI() {
        view.backgroundColor = .paleGrey
        let backButton = UIImage(named: "geri")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        tableView.register(CityCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
}

extension NewCityController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return newCityListVM.contactSection.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return newCityListVM.contactSection[section].uppercased()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vm = self.newCityListVM
        let key = vm.contactSection[section]
        if let value = vm.contactDictionary[key] {
            return value.count
        }
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CityCell
        let key = self.newCityListVM.contactSection[indexPath.section]
        if let value = self.newCityListVM.contactDictionary[key] {
            cell.textLabel?.text = value[indexPath.row]
        }
        return cell
    }

    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.newCityListVM.contactSection
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let index = self.newCityListVM.contactSection.firstIndex(of: title) else {
            return -1
        }
        return index
    }

}

extension NewCityController: NewCityListViewModelProtocol {
    func getCityList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
