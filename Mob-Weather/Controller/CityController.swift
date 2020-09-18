//
//  CityController.swift
//  Mob-Weather
//
//  Created by Burak Donat on 10.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "selectedCityCell"

class CityController: UITableViewController {

    let cityListViewModel: CityListViewModel = CityListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cityListViewModel.delegate = self
        cityListViewModel.printSelecteds()
        self.tableView.separatorStyle = .none
    }
    
    func configureUI() {
        navigationItem.title = "Sehirler"
        view.backgroundColor = .paleGrey
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .purple
        tableView.register(SelectedCityCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    @objc func addButtonTapped() {
        let newCityController = NewCityController()
        navigationController?.pushViewController(newCityController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityListViewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SelectedCityCell
        let vm = self.cityListViewModel.cellForRow(at: indexPath.row)
        cell.setView(name: vm.name, temp: vm.temp, condID: vm.condID)
        return cell
    }
}

extension CityController: CityViewModelProtocol {
    func didGetSelectedCities() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
