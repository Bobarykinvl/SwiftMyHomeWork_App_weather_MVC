//
//  FillableCell.swift
//  TestProject
//
//  Created by Никита on 3.06.21.
//

import Foundation

protocol FillableCell: AnyObject {
    func fill(cellModel: CellModel)
}
