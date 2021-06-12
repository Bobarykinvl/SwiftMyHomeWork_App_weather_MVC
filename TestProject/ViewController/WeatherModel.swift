//
//  WeatherModel.swift
//  TestProject
//
//  Created by Никита on 3.06.21.
//

import Foundation

// Эта модель данных уровня "VC -> Model".
// VC должен обращаться за данными в свою модель, например, VC { model.loadData() }.
class WeatherModel: ScreenModel {
    lazy var dataSource = WeatherDataSource(input: self)
    
    private(set) var cellModels: [CellModel] = [
        GeneralWeatherTableCellModel(cityName: "1", textWeather: "2", degreeWeather: 3),
        WeatherHoursCellModel()
    ]
}

