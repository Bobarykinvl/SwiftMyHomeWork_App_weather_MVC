//
//  CommonDataSource.swift
//  TestProject
//
//  Created by Никита on 10.06.21.
//

import Foundation

protocol DataSource {
    var input: ScreenModel { get }
    init(input: ScreenModel)
}
