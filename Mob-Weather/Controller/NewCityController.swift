//
//  NewCityController.swift
//  Mob-Weather
//
//  Created by Burak Donat on 11.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit
import SnapKit

private let reuseIdentifier = "CityCell"

class NewCityController: UITableViewController {
    
    let newCityListVM: NewCityListViewModel = NewCityListViewModel()
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.isTranslucent = false
        return searchBar
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "buyutec")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getData()
//        setupViews()
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
    
    func setupViews() {
        navigationItem.titleView = searchBar
        searchBar.addSubview(imageView)
        runSnapKitAutoLayout()
    }
    
    func runSnapKitAutoLayout() {
        searchBar.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
        imageView.snp.makeConstraints { (make) in
            make.top.bottom.trailing.equalTo(searchBar.snp.edges)
            make.width.equalTo(16)
        }
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
            let isSelected = newCityListVM.selectedCities.contains(value[indexPath.row])
            cell.setSelectedCell(isSelected)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newCityListVM.handleCitySelection(at: indexPath.section, at: indexPath.row)
        tableView.reloadData()
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
        newCityListVM.getSelecteds()
    }
}
