//
//  WeatherDataSource.swift
//  TestProject
//
//  Created by Никита on 3.06.21.
//

import UIKit

// Нужен, чтобы описать поведение конкретного TableDataSource.

class WeatherDataSource: NSObject, DataSource, UITableViewDataSource {
    
    unowned var input: ScreenModel
    
    required init(input: ScreenModel) {
        self.input = input
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return input.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard input.cellModels.count > indexPath.row else { return .init() }
        
        // TODO: - Need to register cells here.
        tableView.register(GeneralWeatherTableCell.self, forCellReuseIdentifier: GeneralWeatherTableCell.cellIdentifier)
        tableView.register(WeatherHoursCell.self, forCellReuseIdentifier: WeatherHoursCell.cellIdentifier)
        
        // FIXME: - Need change color
        let cellModel = input.cellModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellModel.cellIdentifier,
            for: indexPath
        )
        if let fillableCell = cell as? FillableCell {
            fillableCell.fill(cellModel: cellModel)
        }
        return cell
    }
}
