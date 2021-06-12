//
//  ScreenModel.swift
//  TestProject
//
//  Created by Никита on 10.06.21.
//

import Foundation

// Нужен для того, чтобы каждая модель уровня "VC - Model" описывала и управляла своими Array(CellModels).
protocol ScreenModel: AnyObject {
    var cellModels: [CellModel] { get }
}
