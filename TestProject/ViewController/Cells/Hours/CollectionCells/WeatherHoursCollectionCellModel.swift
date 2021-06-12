//
//  WeatherHoursCellModel.swift
//  TestProject
//
//  Created by Никита on 10.06.21.
//

import Foundation

class WeatherHoursCollectionCellModel: CellModel {
    let time: String
    let degree: String
    let iconType: WeatherIconType
    
    init(time: String, degree: String, iconType: WeatherIconType) {
        self.time = time
        self.degree = degree
        self.iconType = iconType
        super.init(cellIdentifier: WeatherHoursCollectionCell.cellIdentifier)
    }
}
