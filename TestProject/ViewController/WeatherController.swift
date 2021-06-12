//
//  WeatherController.swift
//  TestProject
//
//  Created by Никита on 8.04.21.
//

import UIKit

class WeatherController: UIViewController {
    
    let model = WeatherModel()
    
    // MARK: UI
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = model.dataSource
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: LC VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
}

// MARK: - Configure views

private extension WeatherController {
    
    func configureViews() {
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

