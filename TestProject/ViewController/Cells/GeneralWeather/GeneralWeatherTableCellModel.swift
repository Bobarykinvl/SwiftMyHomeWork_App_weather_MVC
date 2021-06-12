//
//  GeneralWeatherTableCellModel.swift
//  TestProject
//
//  Created by Никита on 3.06.21.
//

import Foundation

class GeneralWeatherTableCellModel: CellModel {
    let cityName: String
    let textWeather: String
    let degreeWeather: Int
    
    init(cityName: String, textWeather: String, degreeWeather: Int) {
        self.cityName = cityName
        self.textWeather = textWeather
        self.degreeWeather = degreeWeather
        super.init(cellIdentifier: GeneralWeatherTableCell.cellIdentifier)
    }
}

// MARK: - Public

extension GeneralWeatherTableCellModel {
    
    var degreeWeatherString: String {
        return "\(degreeWeather) º"
    }
}
